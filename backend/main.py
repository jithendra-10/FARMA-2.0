from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .app.routers import recommendations

app = FastAPI(title="FARMA Backend", version="1.0.0")

# Configure CORS (Allowing all for development simplicity, restrict in production)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include Routers
app.include_router(recommendations.router, tags=["Recommendations"])

@app.get("/")
async def root():
    return {"message": "Welcome to FARMA API"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("backend.main:app", host="0.0.0.0", port=8000, reload=True)
