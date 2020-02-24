
# LabJackM constants and types

const LJM_StreamReadCallback = Ptr{Cvoid}
const LJM_DeviceReconnectCallback = Ptr{Cvoid}

@cenum IODirection::Int32 begin
    READ = 0
    WRITE = 1
end

@cenum LJMDataType::Int32 begin
    UINT16  = 0
    UINT32  = 1
    INT32   = 2
    FLOAT32 = 3
    BYTE    = 99
    STRING  = 98
end

@cenum LJMStringConstant::Int32 begin
    ALLOCATION_SIZE     = 50 # Buffer size include null-terminator
    MAX_SIZE            = 49 # String length
    MAX_NAME_SIZE       = 256
    MAC_STRING_SIZE     = 18
    IPv4_STRING_SIZE    = 16 # for INE_ADDRSTRLEN
end

const BYTES_PER_REGISTER = 2

"NamesToAddresses uses this when a register name is not found"
const INVALID_NAME_ADDRESS = -1

@cenum LJDeviceType::Int32 begin
    dtANY   = 0
    T4      = 4
    T7      = 7
    DIGIT   = 200
    TSERIES = 84
end

@cenum LJConnectionType::Int32 begin
    ctANY           = 0
    ctANY_TCP       = 0
    USB             = 1
    TCP             = 2
    NETWORK_TCP     = 2
    ETHERNET        = 3
    ETHERNET_TCP    = 3
    WIFI            = 4
    WIFI_TCP        = 4
    NETWORK_UDP     = 4
    ETHERNET_UDP    = 6
    WIFI_UDP        = 7
    NETWORK_ANY     = 8
    ETHERNET_ANY    = 9
    WIFI_ANY        = 10
end

@cenum LJNetworkConstant::Int32 begin
    TCP_PORT            = 502
    ETHERNET_UDP_PORT   = 52362
    WIFI_UDP_PORT       = 502
    NO_IP_ADDRESS       = 0
    NO_PORT             = 0
end

const LIST_ALL_SIZE = 128

@cenum LJTimeouts::Int32 begin
    NO_TIMEOUT                                  = 0
    DEFAULT_USB_SEND_RECEIVE_TIMEOUT_MS         = 2600
    DEFAULT_ETHERNET_OPEN_TIMEOUT_MS            = 1000
    DEFAULT_ETHERNET_SEND_RECEIVE_TIMEOUT_MS    = 2600
    DEFAULT_WIFI_OPEN_TIMEOUT_MS                = 1000
    DEFAULT_WIFI_SEND_RECEIVE_TIMEOUT_MS        = 4000
end

@cenum LJThermocouple::Clong begin
    ttB = 6001
    ttE = 6002
    ttJ = 6003
    ttK = 6004
    ttN = 6005
    ttR = 6006
    ttS = 6007
    ttT = 6008
    ttC = 6009
end
