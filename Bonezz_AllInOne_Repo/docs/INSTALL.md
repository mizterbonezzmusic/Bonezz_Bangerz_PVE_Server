# Install (FileZilla)
1) Stop your server.
2) Upload **resources/[bonezz]** to your server's `resources/` directory.
3) In `server.cfg` ensure after core & deps:
```
ensure [bonezz]
ensure bonezz_drugs
ensure bonezz_dealers
ensure bonezz_uc
ensure bonezz_safehouses
ensure bonezz_blips
ensure bonezz_peds
ensure bonezz_events
ensure bonezz_maps
```
4) Copy icons: `resources/[bonezz]/bonezz_drugs/icons/*.png` -> `resources/[qb]/qb-inventory/html/images/`.
5) Add UC job to `qb-core/shared/jobs.lua` (see `docs/UC_JOB.md`).
6) `refresh` then `ensure bonezz_drugs` etc., or restart the server.
