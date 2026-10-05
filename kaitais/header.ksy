meta:
  id: boss_header
  endian: le
seq:
  - id: magic
    type: u4
  - id: version
    type: u4
  - id: file_size
    type: u4
  - id: serial
    type: u8
  - id: const
    type: u2
  - id: padding
    type: u2
  - id: hash 
    type: u2
  - id: rsa
    type: u2
  - id: iv # Short for initialization vector
    size: 12