# Step 4: Push to Output Sink

Auto-pushes the compiled `output/YYYY-MM-DD.md` to your team's shared doc system.

## Supported Sinks

Pick one based on what your team uses:

| Sink | MCP / Tool | Setup |
|------|------------|-------|
| Google Docs | `mcp__google_workspace__*` | Connect Google Workspace MCP |
| Notion | `mcp__notion__*` | Connect Notion MCP |
| Confluence | Atlassian MCP | Connect Atlassian MCP |
| Internal wiki | Custom MCP or webhook | Team-specific |
| None — manual | — | Skip this step; PM copy-pastes |

## Process

1. Read the compiled output file
2. Convert markdown to the target system's format (most MCPs handle this)
3. Push to the destination doc — replacing the previous version, not appending
4. Surface the destination URL in the workflow output for the PM to share

## Why Auto-Push

The single biggest cause of bi-weekly drift is "the markdown is canonical but I forgot to update the shared doc." Auto-push removes the manual step and keeps the shared doc always in sync with the source markdown.

## Fallback

If no MCP is connected, this step prints the destination URL and tells the PM:

> "MCP not connected. Copy the contents of `output/{date}.md` and paste into [destination URL]."

This keeps the workflow runnable even before MCP setup.
