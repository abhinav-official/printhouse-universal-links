# PrintHouse Universal Links

This repository contains the web fallback pages for PrintHouse Catalogue app universal links.

## Custom Scheme Implementation

The app uses the custom scheme `printhousecatalogue://` for direct app opening.

### URL Format

- **Main app**: `printhousecatalogue://`
- **Shared item**: `printhousecatalogue://shared-item?id={itemId}`

### Android App Configuration

To enable the custom scheme in your Android app, add this to your `AndroidManifest.xml`:

```xml
<activity android:name=".MainActivity">
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="printhousecatalogue" />
    </intent-filter>
</activity>
```

For handling shared item URLs:

```xml
<activity android:name=".ItemActivity">
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data
            android:scheme="printhousecatalogue"
            android:host="shared-item" />
    </intent-filter>
</activity>
```

### Testing

1. **Web testing**: Visit `https://printhouse.zcurv.com/item?id=test123`
2. **Direct app testing**: Use `printhousecatalogue://shared-item?id=test123`
3. **Android testing**: `adb shell am start -W -a android.intent.action.VIEW -d 'printhousecatalogue://shared-item?id=test123' com.as360.catalogue`

## Features

- ✅ Custom scheme `printhousecatalogue://` for direct app opening
- ✅ Automatic app detection and redirection
- ✅ Web fallback when app is not installed
- ✅ Manual "Open in App" buttons
- ✅ Android Asset Links configuration
- ✅ Apple App Site Association configuration

## Deployment

Deploy to any static hosting service:

- Cloudflare Pages
- GitHub Pages
- Netlify
- Vercel

## Next Steps

1. Update `YOUR_SHA256_FINGERPRINT_HERE` in `public/.well-known/assetlinks.json`
2. Update `TEAM_ID` in `public/.well-known/apple-app-site-association`
3. Configure your Android app with the intent filters above
4. Test with actual devices
