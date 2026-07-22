# YOUTUBE WATCHLIST — pull transcripts on the Codespace VM (web dead on phone)
# These can't be fetched on the Android/Termux box (browser + web_search hard-dead,
# verified many times: firecrawl Rust/NDK "Failed to determine Android API level").
# When Hermes is running on the Linux VM (codespaces_setup.md), pull each video's
# transcript + summarize, then fold relevant tactics into the build.
# DO NOT fabricate contents from memory — verify live before relying on anything.

=================================================================
QUEUED
=================================================================
1. URL: https://www.youtube.com/watch?v=fddhXXIjB6w&t=741s
   Topic (user-tagged): AI agents / NFTs / autonomous-agent commerce — the
   "agents trading crypto/NFTs" genre (relates to AGENT_COMMERCE_NFT.md).
   User note: "this another related video to the ai nft thing i was talking about."
   Action on VM: pull transcript, extract (a) the specific agent-commerce mechanic
   described, (b) any real examples/named projects, (c) risks/warnings raised.
   Then: cross-check vs AGENT_COMMERCE_NFT.md stance (research/monitor/course only;
   NO autonomous trading until user explicit GO + signed risk policy). Log findings
   to AGENT_COMMERCE_NFT.md under a "LIVE SOURCES" section.

=================================================================
HOW TO PULL ON VM (once Hermes is on Linux)
=================================================================
- web_extract or yt-dlp --write-auto-subs --skip-download <url>
- Summarize in <=200 words, tag SPECULATIVE vs VERIFIED, add to build notes.
- Never present un-verified income/returns claims as fact. Ethics: legal-only.
