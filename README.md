# Emoji React

On-chain emoji reactions on Stacks. Pick one of 10 emoji slots and broadcast your reaction permanently to the Stacks ledger.

## Contract

- **Address:** `SP20Z3WPE6PVN1B8APDQNDH5BR1AJNMR25QPCSGFT.emoji-react`
- **Network:** Stacks Mainnet
- **Clarity Version:** 4

## Functions

- `(react emoji)` — react with `emoji` (1-10). Increments the global emoji tally and the caller's personal counter.
- `(get-emoji-count emoji)` — read-only, total reactions for an emoji.
- `(get-user-count user)` — read-only, total reactions the user has cast.
- `(total)` — read-only, grand total of reactions.

## Frontend

Static HTML in `frontend/`. Connect a Stacks wallet, pick an emoji, send the reaction.

## License

MIT

---

_Last updated: 2026-05-22_
