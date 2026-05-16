# UI and PWA Checklist

## UI design system
- Define typography, spacing scale, color tokens, border radius, shadows, and component states before building screens.
- Use a component library intentionally; do not mix multiple UI libraries.
- Build layouts for desktop, tablet, and mobile from the start.
- Use skeleton states, empty states, loading states, error states, and permission-denied states.
- Make forms robust: labels, help text, validation messages, dirty-state handling, save/cancel behavior.

## Accessibility
- Keyboard navigable menus, dialogs, forms, and tables.
- Visible focus states.
- Sufficient contrast.
- Proper semantic HTML and ARIA only when needed.
- Test important flows without a mouse.

## PWA baseline
- Web app manifest with name, icons, theme color, start URL, and display mode.
- Service worker only when caching strategy is explicit.
- Offline fallback page if offline usage matters.
- Do not cache authenticated API responses blindly.
- Version the cache and provide an update strategy.
- Test installability and offline behavior in browser dev tools.

## Enterprise SaaS UX patterns
- Tenant/workspace switcher if multi-tenant.
- Global search when data volume justifies it.
- Audit/activity panel for admin actions.
- Clear role and permission messaging.
- Import/export flows with validation reports.
- Admin dashboard with system health and recent failed jobs.
