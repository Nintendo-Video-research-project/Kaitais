meta:
  id: link
seq:
  - id: meta_len
    type: u4
    doc: Total length of the metadata block

  - id: link_id
    type: str
    size: 0x30
    encoding: UTF-8
    doc: Text identifier for link

  - id: unknown
    size: 0x8
    doc: Padding? / unknown block preceding the URL data

  - id: url_addr
    type: str
    size: 0x100
    terminator: 0
    encoding: UTF-8
    doc: Fixed 256-byte interactive url string layout

  - id: link_color
    type: u4
    doc: 4-byte RGBA button color value

  instances:
    color_r:
      value: link_color & 0xff
    color_g:
      value: (link_color >> 8) & 0xff
    color_b:
      value: (link_color >> 16) & 0xff
    color_a:
      value: (link_color >> 24) & 0xff