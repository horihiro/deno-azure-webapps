import { parse } from "https://deno.land/std/flags/mod.ts";
import { serve } from "https://deno.land/std@v0.24.0/http/server.ts";

const { args } = Deno;
console.log(parse(args, {alias: {p: "port"}}));
const body:Uint8Array = new TextEncoder().encode("Hello Deno World\n");
const port = parseInt(parse(args, {alias: {p: "port"}}).port || "8080" , 10);
const s = serve({ port });

console.log(`http://localhost:${port}/`);
for await (const req of s) {
  req.respond({ body });
}
