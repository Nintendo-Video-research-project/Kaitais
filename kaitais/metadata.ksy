meta:
  id: boss_metadata
  endian: le
  imports:
    - links
    - timestamp
    - /common/vlq_base128_le

seq:
  - id: len
    type: u4

  - id: vid_id
    type: str
    size: 0x20
    terminator: 0
    encoding: UTF-8
    doc: Fixed 32-byte string buffer for the video identifier
  
  - id: release
    type: timestamp

  - id: expire
    type: timestamp

  - id: vid_title
    type: str
    size: 0x78
    terminator: 0
    encoding: UTF-16LE

  - id: unknown
    size: 0x8
    doc: Padding?

  - id: vid_len
    type: u4
    doc: Duration or length context of video

  - id: vid_desc
    type: str
    terminator: 0
    encoding: UTF-16LE
    doc: UTF-16 video description string payload

  - id: moflex_size
    type: vlq_base128_le
    if: not _io.eof

  - id: moflex_data
    size-eos: true # 🚀 BYPASS: Safely consumes remaining data instead of crashing on the 1GB bug
    if: not _io.eof

  - id: thumbnail_size
    type: vlq_base128_le
    if: not _io.eof
    doc: Size identifier tag driving the JPEG image asset slice

  - id: thumbnail_data
    size: thumbnail_size.value
    if: not _io.eof and thumbnail_size.value > 0
    doc: Raw binary JPEG thumbnail graphic entry data

  - id: interactive_data_size
    type: u4
    if: not _io.eof
    doc: Size identifier driving the underlying links block array

  - id: interactive_links_data
    type: links
    size: interactive_data_size
    if: not _io.eof and interactive_data_size > 0
    doc: Direct layout configuration parsing data mapped to your links.ksy schemas