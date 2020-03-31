meta:
  id: vbmeta
  title: Android VB
  license: CC0-1.0
  file-extension: img
  endian: be
seq:
  - id: header
    type: header
    size: 256
  - id: auth
    size: header.auth_size
  - id: aux
    size: header.aux_size
types:
  position:
    seq:
      - id: offset
        type: u8
      - id: size
        type: u8
  version:
    seq:
      - id: major
        type: u4
      - id: minor
        type: u4
  header:
    seq:
      - id: magic
        contents: AVB0
        size: 4
      - id: version
        type: version
      - id: auth_size
        type: u8
      - id: aux_size
        type: u8
      - id: alg
        type: u4
        enum: alg_type
      - id: hash
        type: position
      - id: sign
        type: position
      - id: pk
        type: position
      - id: pk_meta
        type: position
      - id: desc
        type: position
      - id: rollback_index
        type: u8
      - id: flags
        type: u4
      - id: reserved0
        contents: [0, 0, 0, 0]
      - id: release_string
        type: strz
        size: 48
        encoding: ASCII
    instances:
      hashtree_disabled:
        value: flags & (1 << 0)
      verification_disabled:
        value: flags & (1 << 1)
enums:
  alg_type:
    0: none
    1: sha256_rsa2048
    2: sha256_rsa4096
    3: sha256_rsa8192
    4: sha512_rsa2048
    5: sha512_rsa4096
    6: sha512_rsa8192
