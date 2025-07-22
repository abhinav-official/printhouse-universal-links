# PrintHouse Catalogue Universal Links

This repository hosts the web fallback pages for PrintHouse Catalogue universal links using the domain `printhouse.zcurv.com`.

## 🚀 Quick Start

1. **Update Configuration Files**:

   - Replace `YOUR_TEAM_ID` in `public/.well-known/apple-app-site-association`
   - Replace `YOUR_SHA256_FINGERPRINT` in `public/.well-known/assetlinks.json`

2. **Deploy to Cloudflare Pages**:

   - Connect this repository to Cloudflare Pages
   - Set build output directory to `public`
   - Add custom domain: `printhouse.zcurv.com`

3. **Test Your Setup**:
   ```bash
   ./test-universal-links.sh
   ```

## 📁 Project Structure

```
printhouse-universal-links/
├── public/
│   ├── index.html (main landing page)
│   ├── item.html (shared design page)
│   └── .well-known/
│       ├── apple-app-site-association (iOS config)
│       └── assetlinks.json (Android config)
├── _redirects (Cloudflare Pages routing)
├── README.md
└── test-universal-links.sh (test script)
```

## 🌐 URLs

- **Main Page**: https://printhouse.zcurv.com
- **Shared Design**: https://printhouse.zcurv.com/item?id={itemId}

## 🔧 Configuration

### iOS Universal Links

Update `public/.well-known/apple-app-site-association`:

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

### Android Universal Links

Update `public/.well-known/assetlinks.json`:

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

## 🚀 Deployment Options

### Option 1: Cloudflare Pages (Recommended)

1. Go to Cloudflare Dashboard → Pages
2. Create new project
3. Connect this GitHub repository
4. Set build output directory to `public`
5. Add custom domain: `printhouse.zcurv.com`

### Option 2: GitHub Pages

1. Push to GitHub repository
2. Enable GitHub Pages in repository settings
3. Add custom domain: `printhouse.zcurv.com`
4. Create `CNAME` file with domain

### Option 3: Netlify

1. Connect GitHub repository to Netlify
2. Deploy automatically
3. Add custom domain

### Option 4: Vercel

1. Import GitHub repository to Vercel
2. Deploy with one click
3. Add custom domain

## 🧪 Testing

### Automated Testing

```bash
./test-universal-links.sh
```

### Manual Testing

```bash
# Test DNS
nslookup printhouse.zcurv.com

# Test HTTPS
curl -I https://printhouse.zcurv.com

# Test Apple App Site Association
curl https://printhouse.zcurv.com/.well-known/apple-app-site-association

# Test Android Asset Links
curl https://printhouse.zcurv.com/.well-known/assetlinks.json

# Test web fallback
curl https://printhouse.zcurv.com/item?id=test123
```

### Device Testing

```bash
# iOS Simulator
xcrun simctl openurl booted "https://printhouse.zcurv.com/item?id=test123"

# Android Emulator
adb shell am start -W -a android.intent.action.VIEW -d "https://printhouse.zcurv.com/item?id=test123" com.as360.catalogue
```

## 📱 How It Works

1. **User shares design** from PrintHouse Catalogue app
2. **Deep link created**: `https://printhouse.zcurv.com/item?id=123`
3. **Recipient clicks link**:
   - If app installed: Opens directly to design
   - If app not installed: Shows web fallback page
4. **Web fallback** encourages app download

## 🎨 Customization

### Update Branding

- Replace logo emoji in HTML files
- Update colors in CSS
- Add your actual logo image
- Customize download buttons

### Add Analytics

```javascript
// Add to HTML files
function trackEvent(eventName, parameters = {}) {
  // Google Analytics 4
  if (typeof gtag !== 'undefined') {
    gtag('event', eventName, parameters);
  }

  // Facebook Pixel
  if (typeof fbq !== 'undefined') {
    fbq('track', eventName, parameters);
  }
}
```

### Add Social Media Preview

1. Create `og-image.jpg` (1200x630px)
2. Upload to `https://printhouse.zcurv.com/og-image.jpg`
3. Meta tags already included in HTML

## 🔒 Security

- HTTPS enforced
- Security headers configured
- XSS protection enabled
- Content type sniffing disabled

## 📊 Benefits

✅ **Professional Appearance** - Trustworthy branded links  
✅ **Global CDN** - Fast worldwide delivery  
✅ **SEO Friendly** - Search engine optimized  
✅ **Analytics Ready** - Track link clicks and engagement  
✅ **Web Fallback** - Works for users without app  
✅ **Social Media Ready** - Open Graph and Twitter Cards

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

## 📈 Next Steps

After deployment:

1. Test sharing functionality in app
2. Monitor analytics for link clicks
3. Consider adding QR code generation
4. Implement actual design previews
5. Add more social features

## 📞 Support

For issues or questions:

1. Check the troubleshooting section
2. Verify all URLs are accessible
3. Test with different devices and browsers
4. Review hosting provider documentation

---

**Built with ❤️ for PrintHouse Catalogue**
