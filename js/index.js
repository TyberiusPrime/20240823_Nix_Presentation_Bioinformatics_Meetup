import Reveal from "reveal.js";
import Markdown from "reveal.js/plugin/markdown/markdown.esm";
import Highlight from "reveal.js/plugin/highlight/highlight.esm";
import Notes from "reveal.js/plugin/notes/notes.esm";
import RevealMermaid from "reveal.js-mermaid-plugin/plugin/mermaid/mermaid.js";
// import Mermaid from 'mermaid/dist/mermaid.esm.min.mjs';

Reveal.configure({
  keyboard: {
    40: "next",
    38: "prev",
  },
});
Reveal.initialize({
  hash: true,
  transition: "slide",
  history: "true",
  plugins: [Markdown, Highlight, Notes],

  width: 960,
  height: 700,

  mermaid: {
    fontFamily: '"Arial", sans-serif',
    themeCSS:
      ".label { font-family: Times;font-size:26pt; vertical-align:top;}",
  },

  // Factor of the display size that should remain empty around
  // the content
  margin: 0.04,
  plugins: [RevealMermaid, Highlight],
});

/* Mermaid.initialize({
    startOnLoad: false,
    theme: 'default',
    fontFamily: '"Arial", sans-serif', // Example: Change font family
	      lazyLoad: true,
});
 */
