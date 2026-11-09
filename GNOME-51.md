# TimeTrace 0.1.5: GNOME 51 tracking update

This update keeps the TimeTrace name, original purple icon, executable,
application D-Bus name, desktop entry, database and configuration paths.
The existing KDE and X11 backends remain available. No fork branding is added.

GNOME 51 uses the bundled Shell extension for focus, idle and lock state.
The read-only versioned D-Bus bridge supports bounded event replay, reconnect,
heartbeat timeout and fail-closed foreground tracking. The coordinator prevents
idle/resume from overriding sleep or lock, flushes pending changes on shutdown,
and commits transitions atomically. A checkpoint limits stale intervals after
crashes. Existing app/presence tables are retained; one checkpoint table is added.

Before testing, back up the TimeTrace database and configuration. The update
uses the original data paths and therefore must not run alongside old TimeTrace.
Stop TimeTrace before updating the extension:

```bash
./scripts/install-extension.sh
```

The script backs up the old extension. Log out/in and enable
`timetrace@timetrace.app`. Then launch `timetrace` as usual.
New bridge support is declared only for GNOME 51; older GNOME versions need
separate compatibility testing before broadening metadata.

Validation: 202 tests passed on the separate prototype; real GNOME focus,
idle and lock/unlock were confirmed. This upstream-identity variant still needs
live validation. Suspend/resume, games/fullscreen and multiple monitors remain
unverified. The existing packaging scripts and original icon are preserved.
