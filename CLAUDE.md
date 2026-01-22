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
- HTML: Use semantic elements, vanilla HTML without framework dependencies
- CSS: Use descriptive class names with custom- prefix for project-specific styles
- JavaScript: Vanilla JS only, keep scripts minimal and focused on UI enhancements
- Images: PNG format, 120px height, max-width 250px, optimized for web, consistent dimensions for cards
- Card Structure: Maintain consistent card layout with title, image, and description
- Naming: kebab-case for CSS classes (custom-bg-dark), camelCase for JS variables
- Colors: Dark theme palette (#1e2124 bg, #2c3036 card, #3a4049 hover) consistent with existing design
- Responsive Design: CSS Grid with `repeat(1/2/3, 1fr)` at breakpoints 768px/992px for 3-column card layouts
- Meta Tags: Maintain complete set of SEO tags including OG properties for sharing
- Link Behavior: All project cards open external links in new tabs with onclick handlers
- Analytics: Preserve analytics script tag with correct data-website-id

## Project Organization
- One-page structure with card-based layout for all projects
- Images stored in /images directory with descriptive filenames
- No external framework dependencies - vanilla CSS/JS only
- WebP image formats stored alongside original PNGs in images/webp/ directory

## Performance & Security Optimizations
- CSS Bundle Size: Vanilla CSS (6KB) vs Bootstrap (95KB) - 88KB reduction for simple layouts
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

## CSS Architecture & Patterns
- **CSS Specificity Management**: When mixing utility classes with semantic selectors, class selectors (`.container`) override element selectors (`footer`). Use combined selectors (`footer.container`) to increase specificity and control precedence
- **Vanilla CSS Grid for Responsive Layout**: CSS Grid with `repeat(1/2/3, 1fr)` at different breakpoints (768px, 992px) replaces Bootstrap grid system effectively for card layouts
- **Navbar Mobile Toggle Pattern**: Pure CSS/JS hamburger menu using SVG icon, `display: none` toggle on `.navbar-collapse.show`, z-index layering for dropdown over content

## Testing & Debugging Workflow
- **Playwright for Visual Verification**: Use Playwright with `page.evaluate()` to extract computed CSS values when browser dev tools show different results than file content - catches caching and specificity issues
- **CSS Debugging Pattern**: When styles don't apply, check: (1) browser cache, (2) CSS file served correctly via curl, (3) computed styles in browser, (4) CSS specificity order
- **npx serve Caching**: Development server caches CSS aggressively - kill and restart completely when styles don't update, not just hard refresh