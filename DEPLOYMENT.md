# 🚀 Deployment Guide for PrintHouse Universal Links

This guide will help you deploy the universal links project to your preferred hosting platform.

## 📋 Prerequisites

- GitHub account
- Cloudflare account (for domain management)
- Your app's Team ID (iOS) and SHA256 fingerprint (Android)

## 🔧 Step 1: Update Configuration Files

Before deploying, update these files with your actual values:

### Update iOS Configuration

Edit `public/.well-known/apple-app-site-association`:

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "YOUR_ACTUAL_TEAM_ID.com.as360.catalogue",
        "paths": ["/item*"]
      }
    ]
  }
}
```

### Update Android Configuration

Edit `public/.well-known/assetlinks.json`:

```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.as360.catalogue",
      "sha256_cert_fingerprints": ["YOUR_ACTUAL_SHA256_FINGERPRINT"]
    }
  }
]
```

## 🎯 Step 2: Choose Your Hosting Platform

### Option A: Cloudflare Pages (Recommended)

1. **Create GitHub Repository**:

   ```bash
   git init
   git add .
   git commit -m "Initial commit for universal links"
   git remote add origin https://github.com/yourusername/printhouse-universal-links.git
   git push -u origin main
   ```

2. **Deploy to Cloudflare Pages**:

   - Go to [Cloudflare Dashboard](https://dash.cloudflare.com)
   - Navigate to **Pages**
   - Click **Create a project**
   - Connect your GitHub repository
   - Set build settings:
     - Framework preset: None
     - Build command: (leave empty)
     - Build output directory: `public`
   - Click **Save and Deploy**

3. **Add Custom Domain**:
   - In your Pages project settings
   - Go to **Custom domains**
   - Add `printhouse.zcurv.com`
   - Update your DNS to point to the Pages deployment

### Option B: GitHub Pages

1. **Push to GitHub**:

   ```bash
   git init
   git add .
   git commit -m "Initial commit for universal links"
   git remote add origin https://github.com/yourusername/printhouse-universal-links.git
   git push -u origin main
   ```

2. **Enable GitHub Pages**:

   - Go to your repository on GitHub
   - Click **Settings**
   - Scroll down to **Pages**
   - Under **Source**, select **Deploy from a branch**
   - Select **main** branch
   - Click **Save**

3. **Add Custom Domain**:
   - In GitHub Pages settings
   - Enter `printhouse.zcurv.com` in **Custom domain**
   - Check **Enforce HTTPS**
   - Click **Save**

### Option C: Netlify

1. **Push to GitHub** (same as above)

2. **Deploy to Netlify**:

   - Go to [Netlify](https://netlify.com)
   - Click **New site from Git**
   - Connect your GitHub repository
   - Set build settings:
     - Build command: (leave empty)
     - Publish directory: `public`
   - Click **Deploy site**

3. **Add Custom Domain**:
   - In site settings
   - Go to **Domain management**
   - Add custom domain: `printhouse.zcurv.com`

### Option D: Vercel

1. **Push to GitHub** (same as above)

2. **Deploy to Vercel**:

   - Go to [Vercel](https://vercel.com)
   - Click **New Project**
   - Import your GitHub repository
   - Set build settings:
     - Framework Preset: Other
     - Build Command: (leave empty)
     - Output Directory: `public`
   - Click **Deploy**

3. **Add Custom Domain**:
   - In project settings
   - Go to **Domains**
   - Add `printhouse.zcurv.com`

## 🌐 Step 3: Configure DNS

In your Cloudflare DNS settings:

```
Type: CNAME
Name: printhouse
Target: your-hosting-provider-url
Proxy status: Proxied (orange cloud)
```

**Target URLs by platform:**

- **Cloudflare Pages**: `your-project.pages.dev`
- **GitHub Pages**: `yourusername.github.io`
- **Netlify**: `your-site.netlify.app`
- **Vercel**: `your-project.vercel.app`

## 🧪 Step 4: Test Your Setup

1. **Run the test script**:

   ```bash
   ./test-universal-links.sh
   ```

2. **Test manually**:

   ```bash
   # Test main page
   curl https://printhouse.zcurv.com

   # Test shared link
   curl https://printhouse.zcurv.com/item?id=test123

   # Test iOS config
   curl https://printhouse.zcurv.com/.well-known/apple-app-site-association

   # Test Android config
   curl https://printhouse.zcurv.com/.well-known/assetlinks.json
   ```

3. **Test on devices**:

   ```bash
   # iOS Simulator
   xcrun simctl openurl booted "https://printhouse.zcurv.com/item?id=test123"

   # Android Emulator
   adb shell am start -W -a android.intent.action.VIEW -d "https://printhouse.zcurv.com/item?id=test123" com.as360.catalogue
   ```

## 🎨 Step 5: Customize (Optional)

### Update Branding

- Replace the house emoji (🏠) with your logo
- Update colors in CSS to match your brand
- Add your actual logo image
- Customize download buttons

### Add Analytics

Add this to your HTML files:

```html
<!-- Google Analytics -->
<script
  async
  src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"
></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag() {
    dataLayer.push(arguments);
  }
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

### Add Social Media Preview

1. Create `og-image.jpg` (1200x630px)
2. Upload to `https://printhouse.zcurv.com/og-image.jpg`
3. Meta tags are already included in HTML

## 🔒 Step 6: Security (Optional)

### Add Security Headers

If your hosting platform supports it, add these headers:

```
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
Referrer-Policy: strict-origin-when-cross-origin
X-XSS-Protection: 1; mode=block
```

## 📊 Step 7: Monitor

After deployment:

1. **Test sharing** from your app
2. **Monitor analytics** for link clicks
3. **Check performance** with tools like PageSpeed Insights
4. **Set up alerts** for downtime

## 🛠️ Troubleshooting

### Common Issues

1. **Universal links not working**:

   - Check configuration files are accessible
   - Verify Team ID and SHA256 fingerprint
   - Ensure app is built with latest configuration

2. **Web fallback not showing**:

   - Check DNS configuration
   - Verify hosting provider setup
   - Test with different browsers

3. **SSL certificate issues**:
   - Ensure HTTPS is enabled
   - Check hosting provider SSL settings
   - Verify domain configuration

### Testing Tools

- **iOS**: [Apple's App Search API Validation Tool](https://search.developer.apple.com/appsearch-validation-tool)
- **Android**: [Google's Digital Asset Links API](https://digitalassetlinks.googleapis.com/v1/statements:list?source.web.site=https://printhouse.zcurv.com&relation=delegate_permission/common.handle_all_urls)

## 🎉 Success!

Once deployed, your universal links will:

- ✅ Work seamlessly across all platforms
- ✅ Provide professional web fallback
- ✅ Support social media sharing
- ✅ Enable analytics tracking
- ✅ Scale globally with CDN

Your users can now share designs with professional-looking links that work everywhere!
