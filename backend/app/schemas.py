from pydantic import BaseModel
from typing import Optional, List
from enum import Enum

class RiskLevel(str, Enum):
    Low = "Low"
    Medium = "Medium"
    High = "High"

class FarmerContext(BaseModel):
    district: Optional[str] = None
    state: Optional[str] = None
    soilType: Optional[str] = None
    season: Optional[str] = None
    landArea: Optional[float] = None
    hasIrrigation: Optional[bool] = None

class Recommendation(BaseModel):
    cropName: str
    suitabilityExplanation: str
    waterRequirement: str
    riskLevel: RiskLevel
