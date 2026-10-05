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
      - id: year
        type: u4
      - id: day
        type: u4
      - id: hour
        type: u4
      - id: minutes
        type: u4
      - id: seconds
        type: u4
      - id: padding
        size: 4