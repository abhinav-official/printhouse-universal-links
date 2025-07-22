#!/bin/bash

echo "🔍 Testing Universal Links Setup for printhouse.zcurv.com"
echo "=================================================="

# Test 1: Check if domain resolves
echo "1. Testing DNS resolution..."
if nslookup printhouse.zcurv.com > /dev/null 2>&1; then
    echo "✅ DNS resolution: OK"
else
    echo "❌ DNS resolution: FAILED"
    exit 1
fi

# Test 2: Check HTTPS
echo "2. Testing HTTPS..."
if curl -s -o /dev/null -w "%{http_code}" https://printhouse.zcurv.com | grep -q "200\|301\|302"; then
    echo "✅ HTTPS: OK"
else
    echo "❌ HTTPS: FAILED"
fi

# Test 3: Check Apple App Site Association
echo "3. Testing Apple App Site Association..."
AASA_RESPONSE=$(curl -s https://printhouse.zcurv.com/.well-known/apple-app-site-association)
if echo "$AASA_RESPONSE" | grep -q "applinks"; then
    echo "✅ Apple App Site Association: OK"
    echo "   Content: $AASA_RESPONSE"
else
    echo "❌ Apple App Site Association: FAILED"
    echo "   Response: $AASA_RESPONSE"
fi

# Test 4: Check Android Asset Links
echo "4. Testing Android Asset Links..."
ASSET_LINKS_RESPONSE=$(curl -s https://printhouse.zcurv.com/.well-known/assetlinks.json)
if echo "$ASSET_LINKS_RESPONSE" | grep -q "delegate_permission"; then
    echo "✅ Android Asset Links: OK"
    echo "   Content: $ASSET_LINKS_RESPONSE"
else
    echo "❌ Android Asset Links: FAILED"
    echo "   Response: $ASSET_LINKS_RESPONSE"
fi

# Test 5: Check web fallback page
echo "5. Testing web fallback page..."
WEB_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" https://printhouse.zcurv.com/item?id=test123)
if [ "$WEB_RESPONSE" = "200" ]; then
    echo "✅ Web fallback page: OK"
else
    echo "❌ Web fallback page: FAILED (HTTP $WEB_RESPONSE)"
fi

# Test 6: Check headers
echo "6. Testing security headers..."
HEADERS=$(curl -s -I https://printhouse.zcurv.com/item)
if echo "$HEADERS" | grep -q "X-Frame-Options"; then
    echo "✅ Security headers: OK"
else
    echo "⚠️  Security headers: Missing some headers"
fi

# Test 7: Check main page
echo "7. Testing main page..."
MAIN_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" https://printhouse.zcurv.com)
if [ "$MAIN_RESPONSE" = "200" ]; then
    echo "✅ Main page: OK"
else
    echo "❌ Main page: FAILED (HTTP $MAIN_RESPONSE)"
fi

echo ""
echo "🎯 Testing Complete!"
echo ""
echo "Next steps:"
echo "1. Update TEAM_ID in apple-app-site-association"
echo "2. Update SHA256_FINGERPRINT in assetlinks.json"
echo "3. Test with actual devices"
echo ""
echo "Test commands for devices:"
echo "iOS: xcrun simctl openurl booted 'https://printhouse.zcurv.com/item?id=test123'"
echo "Android: adb shell am start -W -a android.intent.action.VIEW -d 'https://printhouse.zcurv.com/item?id=test123' com.as360.catalogue"
echo ""
echo "Deployment options:"
echo "- Cloudflare Pages: Connect this repo to Cloudflare Pages"
echo "- GitHub Pages: Push to GitHub and enable Pages"
echo "- Netlify: Connect this repo to Netlify"
echo "- Vercel: Import this repo to Vercel" 