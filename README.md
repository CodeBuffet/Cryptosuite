This branch is an experiment to see how hard it is to adapt to Particle.io's Photon Device.

The Plan:

  * Copy the files into the Particle Build IDE. 
  * Find where it breaks. 
  * Fix dependencies - substitute and modify includes. 
  * Change functions or Structures where required. 
  
Please forgive me if I fail to use best practices in the fork, I'm new to this.  Suggestions are appreciated.

Current Status:

  * SHA256 portion works on Photon. 
  * To use - copy sha256.h, sha256.cpp, sha256_config.h, and Arduino.h into the Particle IDE.
  * include sha256.h in your project. For examples see: sha/examples/photon
  
  Results of Photon Test:   
   * Test: RFC4231 4.2 Hash took : 8265 micros
   * Test: RFC4231 4.3 Hash took : 8276 micros
   * Test: RFC4231 4.4 Hash took : 8273 micros
   * Test: RFC4231 4.5 Hash took : 8273 micros
   * Test: RFC4231 4.6 Hash took : 8284 micros  But the result looks like Test: RFC4868 AUTH256-2 (not truncated)
   * Test: RFC4231 4.7 Hash took : 8475 micros
   * Test: RFC4231 4.8 Hash took : 8609 micros

Below this point is unaltered ReadMe from the master.

Please see the full documentation at http://spaniakos.github.io/Cryptosuite

Cryptosuite is a cryptographic library for Arduino (including SHA and HMAC-SHA)

It currently supports secure hashing and hashed message authentication using SHA-1, SHA-256, HMAC-SHA-1 and HMAC-SHA-256.

Installation:
  Make a 'libraries' directory with your Arduino sketches folder if you do not already have one.
  Copy the 'Sha' directory into that directory.
  Restart Arduino to rescan for new libraries.

Using SHA-1:
  #include "sha1.h"
  ...
  uint8_t *hash;
  Sha1.init();
  Sha1.print("This is a message to hash");
  hash = Sha1.result();

  The hash result is then stored in hash[0], hash[1] .. hash[19].

Using HMAC-SHA-1:
  #include "sha1.h"
  ...
  uint8_t *hash;
  Sha1.initHmac("hash key",8); // key, and length of key in bytes
  Sha1.print("This is a message to hash");
  hash = Sha1.resultHmac();

  The hash result is then stored in hash[0], hash[1] .. hash[19].

Using SHA-256:
  #include "sha256.h"
  ...
  uint8_t *hash;
  Sha256.init();
  Sha256.print("This is a message to hash");
  hash = Sha256.result();

  The hash result is then stored in hash[0], hash[1] .. hash[31].

Using HMAC-SHA-256:
  #include "sha256.h"
  ...
  uint8_t *hash;
  Sha256.initHmac("hash key",8); // key, and length of key in bytes
  Sha256.print("This is a message to hash");
  hash = Sha256.resultHmac();

  The hash result is then stored in hash[0], hash[1] .. hash[31].


Verification:
  The provided example code tests against published test vectors.
  SHA-1: FIPS 180-2, RFC3174 compliant
  HMAC-SHA-1: FIPS 198a compliant
  SHA-256: FIPS 180-2, RFC4231 compliant
  HMAC-SHA-256:  RFC4231 compliant

*UPDATE** Added Intel Galileo Support
Added printf.h so galileo can redirect to serial all the printf requests.

*UPDATE** Raspberry pi support added
### Raspberry  pi
install
```
sudo make install
cd examples_Rpi
make
```

What to do after changes to the library
```
sudo make clean
sudo make install
cd examples_Rpi
make clean
make
```

What to do after changes to a sketch
```
cd examples_Rpi
make <sketch>

or 
make clean
make
```

How to start a sketch
```
cd examples_Rpi
sudo ./<sketch>
```

