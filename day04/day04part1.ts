import { crypto } from "@std/crypto/crypto";

const input = await Deno.readTextFile("input")
const encoder = new TextEncoder();
let salt = 0

while (true) {
  const md5 = await crypto.subtle.digest("MD5", encoder.encode(input + salt));
  const array = new Uint8Array(md5)
  if (array.at(0) == 0 && array.at(1) == 0 && array.at(2)! < 0x10) {
    console.log(salt)
    break
  }
  salt = salt + 1
}
