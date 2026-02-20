# Quick Deploy Script - Run these commands in order

# Step 1: Check Git status
git status

# Step 2: Add all files (including model files)
git add .

# Step 3: Commit changes
git commit -m "Deploy: Added deployment configs and model files"

# Step 4: Push to GitHub
git push origin main
# OR if your branch is named master or something else:
# git push origin master

# If you haven't set up a remote yet, use:
# git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git
# git branch -M main
# git push -u origin main

# ============================================
# After pushing to GitHub, deploy here:
# ============================================

# BACKEND (Render.com):
# 1. Go to https://render.com/
# 2. Sign up/Login (use GitHub)
# 3. Click "New +" → "Web Service"
# 4. Connect your GitHub repo
# 5. Settings:
#    - Name: startup-predictor-api
#    - Root Directory: (leave empty)
#    - Build Command: pip install -r requirements.txt
#    - Start Command: uvicorn app:app --host 0.0.0.0 --port $PORT
# 6. Click "Create Web Service"
# 7. Wait 2-3 minutes for deployment
# 8. COPY YOUR URL (e.g., https://startup-predictor-api.onrender.com)

# FRONTEND (Vercel.com):
# 1. Go to https://vercel.com/
# 2. Sign up/Login (use GitHub)
# 3. Click "Add New" → "Project"
# 4. Import your GitHub repository
# 5. Configure:
#    - Framework Preset: Vite
#    - Root Directory: clever-forecast-main
#    - Build Command: npm run build
#    - Output Directory: dist
# 6. Add Environment Variable:
#    - Name: VITE_API_URL
#    - Value: YOUR_RENDER_URL (from step 8 above)
# 7. Click "Deploy"
# 8. Your app will be live at https://your-project.vercel.app

# ============================================
# ALTERNATIVE: Railway (Both in one place)
# ============================================
# 1. Go to https://railway.app/
# 2. Sign up/Login with GitHub
# 3. "New Project" → "Deploy from GitHub repo"
# 4. Select your repo
# 5. Railway auto-detects both services
# 6. Configure environment variables in Railway dashboard
# 7. Get both URLs from Railway

echo "Follow the steps above to deploy your app!"
