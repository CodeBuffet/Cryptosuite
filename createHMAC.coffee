key = []
for i in [0...parseInt(process.argv[2])]
  b = new Buffer(1)
  b[0] = Math.round(Math.random() * 255)
  key.push "0x#{b.toString('hex')}"

console.log "Result (len: #{key.length}):"
console.log "uint8_t hmacKey1[]={\n\t#{key.join(", ")}\n};"
