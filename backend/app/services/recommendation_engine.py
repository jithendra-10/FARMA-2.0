import joblib
import pickle
import os
import pandas as pd
import numpy as np
from ..schemas import FarmerContext, Recommendation, RiskLevel

# Model Paths
MODEL_DIR = os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(__file__))), "models")
MODEL_PATH = os.path.join(MODEL_DIR, "crop_recommendation_model.pkl")
SOIL_ENCODER_PATH = os.path.join(MODEL_DIR, "soil_encoder.pkl")
CROP_ENCODER_PATH = os.path.join(MODEL_DIR, "crop_encoder.pkl")

# Static Metadata (since model doesn't provide this)
CROP_METADATA = {
    "rice": {"water": "High", "risk": RiskLevel.Low, "reason": "Suitable for clayey/loamy soil with high water."},
    "paddy": {"water": "High", "risk": RiskLevel.Low, "reason": "Requires standing water and clayey soil."},
    "maize": {"water": "Medium", "risk": RiskLevel.Low, "reason": "Hardy crop, suitable for well-drained loamy soil."},
    "cotton": {"water": "Medium", "risk": RiskLevel.Medium, "reason": "Good for black soil, but watch for pests."},
    "coffee": {"water": "Medium", "risk": RiskLevel.Medium, "reason": "Needs specific altitude and shade."},
    "jute": {"water": "High", "risk": RiskLevel.Medium, "reason": "Requires alluvial soil and high humidity."},
    "sugarcane": {"water": "High", "risk": RiskLevel.Low, "reason": "Long duration crop, loves deep loamy soil."},
    "wheat": {"water": "Medium", "risk": RiskLevel.Low, "reason": "Cool season crop, loam/clay-loam is best."},
    "millets": {"water": "Low", "risk": RiskLevel.Low, "reason": "Drought resistant, good for poor soils."},
    "tobacco": {"water": "Medium", "risk": RiskLevel.High, "reason": "Sensitive to waterlogging, needs specific processing."},
    "barley": {"water": "Low", "risk": RiskLevel.Low, "reason": "Can tolerate saline soil better than wheat."},
    "oil seeds": {"water": "Low", "risk": RiskLevel.Medium, "reason": "Diverse group, generally needs well-drained soil."},
    "ground nuts": {"water": "Medium", "risk": RiskLevel.Medium, "reason": "Prefers sandy loam, sensitive to aflatoxin."},
    "pulses": {"water": "Low", "risk": RiskLevel.Low, "reason": "Nitrogen fixing, good for soil health."},
}

class RecommendationEngine:
    def __init__(self):
        self.model = None
        self.soil_encoder = None
        self.crop_encoder = None
        self.load_models()

    def load_models(self):
        try:
            # Try loading with pickle first, fallback to joblib (based on inspection)
            try:
                with open(MODEL_PATH, 'rb') as f: self.model = pickle.load(f)
            except:
                self.model = joblib.load(MODEL_PATH)

            try:
                with open(SOIL_ENCODER_PATH, 'rb') as f: self.soil_encoder = pickle.load(f)
            except:
                self.soil_encoder = joblib.load(SOIL_ENCODER_PATH)
                
            try:
                with open(CROP_ENCODER_PATH, 'rb') as f: self.crop_encoder = pickle.load(f)
            except:
                self.crop_encoder = joblib.load(CROP_ENCODER_PATH)
                
            print("Models loaded successfully.")
        except Exception as e:
            print(f"Error loading models: {e}")
            self.model = None

    def get_recommendations(self, context: FarmerContext) -> list[Recommendation]:
        if not self.model or not context.soilType:
            return []

        try:
            # 1. Preprocess Input (Only Soil Type is used by this specific model)
            soil_lower = context.soilType.lower()
            
            # Check if soil type is known
            if soil_lower not in self.soil_encoder.classes_:
                return [] # Or return default/fallback

            encoded_soil = self.soil_encoder.transform([soil_lower])[0]

            # 2. Predict (Get probabilities to suggest top 3)
            # Reshape for single sample
            # Note: Model expects a DataFrame or 2D array. Inspection showed feature name 'soil_enc'.
            input_data = pd.DataFrame({'soil_enc': [encoded_soil]}) 
            
            probs = self.model.predict_proba(input_data)[0]
            
            # Get indices of top 3 probabilities
            top_indices = probs.argsort()[-3:][::-1]
            
            recommendations = []
            for idx in top_indices:
                if probs[idx] > 0.05: # Threshold to ignore very unlikely crops
                    crop_label = self.crop_encoder.inverse_transform([idx])[0]
                    meta = CROP_METADATA.get(crop_label.lower(), {
                        "water": "Medium", "risk": RiskLevel.Medium, "reason": f"suitable for {context.soilType} soil."
                    })
                    
                    rec = Recommendation(
                        cropName=crop_label.capitalize(),
                        suitabilityExplanation=meta["reason"],
                        waterRequirement=meta["water"],
                        riskLevel=meta["risk"]
                    )
                    recommendations.append(rec)
            
            return recommendations

        except Exception as e:
            print(f"Prediction error: {e}")
            return []

engine = RecommendationEngine()
