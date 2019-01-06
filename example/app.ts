import * as deno from "deno";
import { serve } from "https://deno.land/x/net/http.ts";

const PORT = deno.env().PORT || 3000; 
const s = serve(`0.0.0.0:${PORT}`);

async function main() {
  for await (const req of s) {
    req.respond({
      body: new TextEncoder().encode("Hello Deno\n")
    });
  }
}

main();
