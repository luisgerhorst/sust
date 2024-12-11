#![no_std]

#[repr(C)]
#[derive(Clone, Copy)]
pub struct PacketLog {
    pub ipv4_address: u64,
    pub action: u64,
}

#[cfg(feature = "user")]
unsafe impl aya::Pod for PacketLog {}
