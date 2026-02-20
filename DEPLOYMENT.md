# 🚀 Deployment Guide

## Quick Deploy with Link Access

### Option 1: Vercel (Easiest - One Click)

#### Frontend (React):
1. Push your code to GitHub
2. Go to https://vercel.com
3. Click "Import Project"
4. Select your GitHub repository
5. Set root directory to: `clever-forecast-main`
6. Click "Deploy"
7. You'll get a link like: `https://your-app.vercel.app`

#### Backend (FastAPI):
Since Vercel doesn't support long-running Python processes well, use Render for backend:

1. Go to https://render.com
2. Click "New +" → "Web Service"
3. Connect your GitHub repo
4. Set:
   - **Name**: startup-predictor-api
   - **Root Directory**: `.` (leave empty or root)
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `uvicorn app:app --host 0.0.0.0 --port $PORT`
5. Click "Create Web Service"
6. You'll get a link like: `https://your-api.onrender.com`

### Option 2: Railway (All-in-One)

#### Deploy Both Together:
1. Go to https://railway.app
2. Click "Start a New Project"
3. Select "Deploy from GitHub repo"
4. Railway will auto-detect both services
5. Configure:
   - **Backend**: Automatically detects Python
   - **Frontend**: Set root directory to `clever-forecast-main`
6. Get your links:
   - Frontend: `https://your-app.up.railway.app`
   - Backend: `https://your-api.up.railway.app`

### Option 3: GitHub Pages (Frontend Only - FREE)

**Note**: GitHub Pages only hosts static files, so you need separate backend hosting.

1. Build your frontend:
   ```bash
   cd clever-forecast-main
   npm run build
   ```

2. Configure GitHub Pages:
   - Go to your repo → Settings → Pages
   - Source: Deploy from a branch
   - Branch: `main` → `/docs` or `/root`

3. Update `vite.config.ts` with your repo name for proper routing

4. Deploy backend to Render (see above)

### 📝 Important: Update Frontend API URL

Once you have your backend URL, update the frontend to use it:

**File**: `clever-forecast-main/src/lib/predict.ts`

Change API URL from:
```typescript
const API_URL = "http://localhost:8000";
```

To:
```typescript
const API_URL = "https://your-api.onrender.com";  // or your backend URL
```

### ✅ Prerequisites Before Deployment:

1. **Run your Jupyter notebook** to generate `startup_model.pkl` and `encoder.pkl`
2. **Commit these .pkl files** to your repository (they're needed by the backend)
3. **Test locally** that both frontend and backend work together

### 🔗 Testing Your Deployed App:

After deployment, you'll have:
- **Frontend URL**: Your React app accessible via browser
- **Backend URL**: Your API with docs at `/docs` endpoint

---

## Recommended Approach (Best Free Option):

✅ **Frontend**: Vercel (https://vercel.com) - Deploy from `clever-forecast-main` folder
✅ **Backend**: Render (https://render.com) - Deploy from root folder

Both services have generous free tiers and are the easiest to set up!
