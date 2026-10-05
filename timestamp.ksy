meta:
  id: timestamp
  endian: le

seq:
  - id: release_date
    type: timestamp
    
  - id: expiry_date
    type: timestamp

types:
  timestamp:
  seq:
    - id: Year
      type: u4
    - id: Day
      type: u4
    - id: Hour
      type: u4
    - id: Minutes
      type: u4
    - id: Seconds
      type: u4
    - id: Padding
      size: 4