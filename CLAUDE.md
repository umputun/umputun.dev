# CLAUDE.md - Guidelines for Agentic Coding in umputun.dev

## Build & Deploy Commands
- Local server: `docker build -t umputun-dev . && docker run -p 8080:8080 umputun-dev`
- Static file serving: `npx serve .` (alternative quick dev option)
- HTML validation: `npx html-validate index.html`
- CSS lint: `npx stylelint styles.css`
- Optimize images: `imagemin images/* --out-dir=images`
- Validate links: `npx broken-link-checker https://localhost:8080 --recursive`
- CSS Optimization: `npx purgecss --css bootstrap.min.css --content index.html --output css-min/bootstrap.min.css`

## Code Style Guidelines
- HTML: Use semantic elements, maintain Bootstrap 5.x conventions with custom dark theme
- CSS: Use descriptive class names with custom- prefix for project-specific styles
- JavaScript: Vanilla JS only, keep scripts minimal and focused on UI enhancements
- Images: PNG format, 120px height, optimized for web, consistent dimensions for cards
- Card Structure: Maintain consistent card layout with title, image, and description
- Naming: kebab-case for CSS classes (custom-bg-dark), camelCase for JS variables
- Colors: Dark theme palette (#343a40, #3b4449, #354552) consistent with existing design
- Responsive Design: Bootstrap grid with col-md-6 col-lg-4 pattern for cards
- Meta Tags: Maintain complete set of SEO tags including OG properties for sharing
- Link Behavior: All project cards open external links in new tabs with onclick handlers
- Analytics: Preserve analytics script tag with correct data-website-id

## Project Organization
- One-page structure with card-based layout for all projects
- Images stored in /images directory with descriptive filenames
- External dependencies (Bootstrap CSS/JS) included directly in root directory
- Optimized Bootstrap CSS stored in css-min/bootstrap.min.css (reduced from 227KB to 14KB)
- WebP image formats stored alongside original PNGs in images/webp/ directory

## Performance & Security Optimizations
- CSS Optimization: Use PurgeCSS to extract only the required Bootstrap components
- Image Optimization: Provide WebP versions of all images with proper <picture> fallbacks
- Security Headers: Security headers should be added in Cloudflare dashboard, not in Dockerfile
  - Content-Security-Policy: Allow scripts from self and analytics.umputun.com
  - Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
  - X-Frame-Options: DENY
  - Cross-Origin-Opener-Policy: same-origin
  - X-Content-Type-Options: nosniff
  - Referrer-Policy: strict-origin-when-cross-origin
  - Permissions-Policy: restricting camera, microphone, geolocation
- Caching: Different cache durations for different content types in reproxy