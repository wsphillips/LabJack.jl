
function ListAll(DeviceType::LJDeviceType, ConnectionType::LJConnectionType, NumFound::Ref{Int32}, aDeviceTypes::Vector{Int32}, aConnectionTypes::Vector{Int32}, aSerialNumbers::Vector{Int32}, aIPAddresses::Vector{Int32})
    ccall((:LJM_ListAll, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), DeviceType, ConnectionType, NumFound, aDeviceTypes, aConnectionTypes, aSerialNumbers, aIPAddresses)
end

function ListAllS(DeviceType::LJDeviceType, ConnectionType::LJConnectionType, NumFound::Ref{Int32}, aDeviceTypes::Vector{Int32}, aConnectionTypes::Vector{Int32}, aSerialNumbers::Vector{Int32}, aIPAddresses::Vector{Int32})
    ccall((:LJM_ListAllS, :libLabJackM), Cint, (Cstring, Cstring, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), DeviceType, ConnectionType, NumFound, aDeviceTypes, aConnectionTypes, aSerialNumbers, aIPAddresses)
end

function ListAllExtended(DeviceType::LJDeviceType, ConnectionType::LJConnectionType, NumAddresses::Integer, aAddresses::Vector{Cint}, aNumRegs::Vector{Cint}, MaxNumFound::Integer, NumFound::Ref{Cint}, aDeviceTypes::Vector{Cint}, aConnectionTypes::Vector{Cint}, aSerialNumbers::Vector{Cint}, aIPAddresses::Vector{Cint}, aBytes::Vector{Cuchar})
    ccall((:LJM_ListAllExtended, :libLabJackM), Cint, (Cint, Cint, Cint, Ref{Cint}, Ref{Cint}, Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cuchar}), DeviceType, ConnectionType, NumAddresses, aAddresses, aNumRegs, MaxNumFound, NumFound, aDeviceTypes, aConnectionTypes, aSerialNumbers, aIPAddresses, aBytes)
end

function OpenS(DeviceType::String, ConnectionType::String, Identifier, Handle::Ref{Cint})
    ccall((:LJM_OpenS, :libLabJackM), Cint, (Cstring, Cstring, Cstring, Ref{Cint}), DeviceType, ConnectionType, Identifier, Handle)
end

function Open(DeviceType::LJDeviceType, ConnectionType::LJConnectionType, Identifier, Handle::Ref{Cint})
    ccall((:LJM_Open, :libLabJackM), Cint, (Cint, Cint, Cstring, Ref{Cint}), DeviceType, ConnectionType, Identifier, Handle)
end

function GetHandleInfo(Handle::Cint, DeviceType::Ref{Cint}, ConnectionType::Ref{Cint}, SerialNumber::Ref{Cint}, IPAddress::Ref{Cint}, Port::Ref{Cint}, MaxBytesPerMB::Ref{Cint})
    ccall((:LJM_GetHandleInfo, :libLabJackM), Cint, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), Handle, DeviceType, ConnectionType, SerialNumber, IPAddress, Port, MaxBytesPerMB)
end

function Close(Handle::Cint)
    ccall((:LJM_Close, :libLabJackM), Cint, (Cint,), Handle)
end

function CloseAll()
    ccall((:LJM_CloseAll, :libLabJackM), Cint, ())
end

function CleanInfo(InfoHandle::Cint)
    ccall((:LJM_CleanInfo, :libLabJackM), Cint, (Cint,), InfoHandle)
end

function eWriteAddress(Handle::Cint, Address::Integer, type::LJMDataType, Value)
    ccall((:LJM_eWriteAddress, :libLabJackM), Cint, (Cint, Cint, Cint, Cdouble), Handle, Address, type, Value)
end

function eReadAddress(Handle::Cint, Address::Integer, type::LJMDataType, Value::Ref{Cdouble})
    ccall((:LJM_eReadAddress, :libLabJackM), Cint, (Cint, Cint, Cint, Ptr{Cdouble}), Handle, Address, type, Value)
end

function eWriteName(Handle::Cint, Name::String, Value)
    ccall((:LJM_eWriteName, :libLabJackM), Cint, (Cint, Cstring, Cdouble), Handle, Name, Value)
end

function eReadName(Handle::Cint, Name::String, Value)
    ccall((:LJM_eReadName, :libLabJackM), Cint, (Cint, Cstring, Ptr{Cdouble}), Handle, Name, Value)
end

function eReadAddresses(Handle::Cint, NumFrames::Integer, aAddresses::Vector{T}, aTypes::Vector{LJMDataType}, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint}) where {T <: Integer}
    ccall((:LJM_eReadAddresses, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, Cint.(aAddresses), aTypes, aValues, ErrorAddress)
end

function eReadNames(Handle::Cint, NumFrames::Integer, aNames::Vector{String}, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadNames, :libLabJackM), Cint, (Cint, Cint, Ref{Cstring}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aNames, aValues, ErrorAddress)
end

function eWriteAddresses(Handle::Cint, NumFrames::Integer, aAddresses::Vector{T}, aTypes::Vector{LJMDataType}, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint}) where {T <: Integer}
    ccall((:LJM_eWriteAddresses, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, Cint.(aAddresses), aTypes, aValues, ErrorAddress)
end

function eWriteNames(Handle::Cint, NumFrames::Integer, aNames::Vector{String}, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteNames, :libLabJackM), Cint, (Cint, Cint, Ref{Cstring}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aNames, aValues, ErrorAddress)
end

function eReadAddressArray(Handle::Cint, Address::Integer, type::LJMDataType, NumValues::Integer, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadAddressArray, :libLabJackM), Cint, (Cint, Cint, Cint, Cint, Ref{Cdouble}, Ref{Cint}), Handle, Address, type, NumValues, aValues, ErrorAddress)
end

function eReadNameArray(Handle::Cint, Name::String, NumValues::Integer, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadNameArray, :libLabJackM), Cint, (Cint, Cstring, Cint, Ref{Cdouble}, Ref{Cint}), Handle, Name, NumValues, aValues, ErrorAddress)
end

function eWriteAddressArray(Handle::Cint, Address::Integer, type::LJMDataType, NumValues::Integer, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteAddressArray, :libLabJackM), Cint, (Cint, Cint, Cint, Cint, Ref{Cdouble}, Ref{Cint}), Handle, Address, type, NumValues, aValues, ErrorAddress)
end

function eWriteNameArray(Handle::Cint, Name::String, NumValues::Integer, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteNameArray, :libLabJackM), Cint, (Cint, Cstring, Cint, Ref{Cdouble}, Ref{Cint}), Handle, Name, NumValues, aValues, ErrorAddress)
end

function eReadAddressByteArray(Handle::Cint, Address::Integer, NumBytes::Integer, aBytes::Vector{UInt8}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadAddressByteArray, :libLabJackM), Cint, (Cint, Cint, Cint, Ref{UInt8}, Ref{Cint}), Handle, Address, NumBytes, aBytes, ErrorAddress)
end

function eReadNameByteArray(Handle::Cint, Name::String, NumBytes::Integer, aBytes::Vector{UInt8}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadNameByteArray, :libLabJackM), Cint, (Cint, Cstring, Cint, Ref{UInt8}, Ref{Cint}), Handle, Name, NumBytes, aBytes, ErrorAddress)
end

function eWriteAddressByteArray(Handle::Cint, Address::Integer, NumBytes::Integer, aBytes::Vector{UInt8}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteAddressByteArray, :libLabJackM), Cint, (Cint, Cint, Cint, Ref{UInt8}, Ref{Cint}), Handle, Address, NumBytes, aBytes, ErrorAddress)
end

function eWriteNameByteArray(Handle::Cint, Name::String, NumBytes::Integer, aBytes::Vector{UInt8}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteNameByteArray, :libLabJackM), Cint, (Cint, Cstring, Cint, Ref{UInt8}, Ref{Cint}), Handle, Name, NumBytes, aBytes, ErrorAddress)
end

function eAddresses(Handle::Cint, NumFrames::Integer, aAddresses::Vector{<:Integer}, aTypes::Vector{LJMDataType}, aWrites::Vector{<:Integer}, aNumValues::Vector{<:Integer}, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint}) where {T <: Integer}
    ccall((:LJM_eAddresses, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, Cint.(aAddresses), aTypes, Cint.(aWrites), Cint.(aNumValues), aValues, ErrorAddress)
end

function eNames(Handle::Cint, NumFrames::Integer, aNames::Vector{Cstring}, aWrites::Vector{<:Integer}, aNumValues::Vector{<:Integer}, aValues::Vector{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eNames, :libLabJackM), Cint, (Cint, Cint, Ref{Cstring}, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aNames, Cint.(aWrites), Cint.(aNumValues), aValues, ErrorAddress)
end

function eReadNameString(Handle::Cint, Name::String, ret_string::Vector{UInt8})
    ccall((:LJM_eReadNameString, :libLabJackM), Cint, (Cint, Cstring, Ptr{UInt8}), Handle, Name, ret_string)
end

function eReadAddressString(Handle::Cint, Address::Integer, ret_string::Vector{UInt8})
    ccall((:LJM_eReadAddressString, :libLabJackM), Cint, (Cint, Cint, Ptr{UInt8}), Handle, Address, ret_string)
end

function eWriteNameString(Handle::Cint, Name::String, input_string::String)
    ccall((:LJM_eWriteNameString, :libLabJackM), Cint, (Cint, Cstring, Cstring), Handle, Name, input_string)
end

function eWriteAddressString(Handle::Cint, Address::Integer, input_string::String)
    ccall((:LJM_eWriteAddressString, :libLabJackM), Cint, (Cint, Cint, Cstring), Handle, Address, input_string)
end

function eStreamStart(Handle::Cint, ScansPerRead::Integer, NumAddresses::Integer, aScanList::Vector{<:Integer}, ScanRate::Ref{Cdouble})
    ccall((:LJM_eStreamStart, :libLabJackM), Cint, (Cint, Cint, Cint, Ref{Cint}, Ref{Cdouble}), Handle, ScansPerRead, NumAddresses, Cint.(aScanList), ScanRate)
end

function eStreamRead(Handle::Cint, aData::Vector{Cdouble}, DeviceScanBacklog::Ref{Cint}, LJMScanBacklog::Ref{Cint})
    ccall((:LJM_eStreamRead, :libLabJackM), Cint, (Cint, Ref{Cdouble}, Ref{Cint}, Ref{Cint}), Handle, aData, DeviceScanBacklog, LJMScanBacklog)
end

function SetStreamCallback(Handle::Cint, Callback::LJM_StreamReadCallback, Arg::T) where {T}
    ccall((:LJM_SetStreamCallback, :libLabJackM), Cint, (Cint, LJM_StreamReadCallback, Ptr{T}), Handle, Callback, Arg)
end

function eStreamStop(Handle::Cint)
    ccall((:LJM_eStreamStop, :libLabJackM), Cint, (Cint,), Handle)
end

function StreamBurst(Handle::Cint, NumAddresses::Integer, aScanList::Vector{<:Integer}, ScanRate::Ref{Cdouble}, NumScans::Integer, aData::Vector{Cdouble})
    ccall((:LJM_StreamBurst, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cdouble}, UInt32, Ref{Cdouble}), Handle, NumAddresses, Cint.(aScanList), ScanRate, NumScans, aData)
end

function GetStreamTCPReceiveBufferStatus(Handle::Cint, ReceiveBufferBytesSize::Ref{UInt32}, ReceiveBufferBytesBacklog::Ref{UInt32})
    ccall((:LJM_GetStreamTCPReceiveBufferStatus, :libLabJackM), Cint, (Cint, Ref{UInt32}, Ref{UInt32}), Handle, ReceiveBufferBytesSize, ReceiveBufferBytesBacklog)
end

function WriteRaw(Handle::Cint, Data::Vector{Cuchar}, NumBytes::Integer)
    ccall((:LJM_WriteRaw, :libLabJackM), Cint, (Cint, Ref{Cuchar}, Cint), Handle, Data, NumBytes)
end

function ReadRaw(Handle::Cint, Data::Vector{Cuchar}, NumBytes::Integer)
    ccall((:LJM_ReadRaw, :libLabJackM), Cint, (Cint, Ref{Cuchar}, Cint), Handle, Data, NumBytes)
end

function AddressesToMBFB(MaxBytesPerMBFB::Integer, aAddresses::Ref{<:Integer}, aTypes::Vector{LJMDataType}, aWrites::Vector{<:Integer}, aNumValues::Vector{<:Integer}, aValues::Vector{Cdouble}, NumFrames::Vector{Cint}, aMBFBCommand::Vector{Cuchar})
    ccall((:LJM_AddressesToMBFB, :libLabJackM), Cint, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}, Ref{Cuchar}), MaxBytesPerMBFB, Cint.(aAddresses), aTypes, Cint.(aWrites), Cint.(aNumValues), aValues, NumFrames, aMBFBCommand)
end

function MBFBComm(Handle::Cint, UnitID::Cuchar, aMBFB::Ref{Cuchar}, ErrorAddress::Ref{Cint})
    ccall((:LJM_MBFBComm, :libLabJackM), Cint, (Cint, Cuchar, Ref{Cuchar}, Ref{Cint}), Handle, UnitID, aMBFB, ErrorAddress)
end

function UpdateValues(aMBFBResponse::Ref{Cuchar}, aTypes::Ref{Cint}, aWrites::Ref{Cint}, aNumValues::Ref{Cint}, NumFrames::Cint, aValues::Ref{Cdouble})
    ccall((:LJM_UpdateValues, :libLabJackM), Cint, (Ref{Cuchar}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Cint, Ref{Cdouble}), aMBFBResponse, aTypes, aWrites, aNumValues, NumFrames, aValues)
end

function NamesToAddresses(NumFrames::Cint, aNames::Ref{Cstring}, aAddresses::Ref{Cint}, aTypes::Ref{Cint})
    ccall((:LJM_NamesToAddresses, :libLabJackM), Cint, (Cint, Ref{Cstring}, Ref{Cint}, Ref{Cint}), NumFrames, aNames, aAddresses, aTypes)
end

function NameToAddress(Name, Address::Ref{Cint}, Type::Ref{Cint})
    ccall((:LJM_NameToAddress, :libLabJackM), Cint, (Cstring, Ref{Cint}, Ref{Cint}), Name, Address, Type)
end

function AddressesToTypes(NumAddresses::Integer, aAddresses::Vector{<:Integer}, aTypes::Vector{Cint})
    ccall((:LJM_AddressesToTypes, :libLabJackM), Cint, (Cint, Ref{Cint}, Ref{Cint}), NumAddresses, Cint.(aAddresses), aTypes)
end

function AddressToType(Address::Integer, Type::Ref{Cint})
    ccall((:LJM_AddressToType, :libLabJackM), Cint, (Cint, Ref{Cint}), Address, Type)
end

function LookupConstantValue(Scope::String, ConstantName::String, ConstantValue::Ref{Cdouble})
    ccall((:LJM_LookupConstantValue, :libLabJackM), Cint, (Cstring, Cstring, Ref{Cdouble}), Scope, ConstantName, ConstantValue)
end

function LookupConstantName(Scope::String, ConstantValue::Cdouble, ConstantName::Vector{UInt8})
    ccall((:LJM_LookupConstantName, :libLabJackM), Cint, (Cstring, Cdouble, Ref{UInt8}), Scope, ConstantValue, ConstantName)
end

function ErrorToString(ErrorCode::Integer, ErrorString)
    ccall((:LJM_ErrorToString, :libLabJackM), Cint, (Cint, Cstring), ErrorCode, ErrorString)
end

function LoadConstants()
    ccall((:LJM_LoadConstants, :libLabJackM), Cint, ())
end

function LoadConstantsFromFile(FileName::String)
    ccall((:LJM_LoadConstantsFromFile, :libLabJackM), Cint, (Cstring,), FileName)
end

function LoadConstantsFromString(JsonString::String)
    ccall((:LJM_LoadConstantsFromString, :libLabJackM), Cint, (Cstring,), JsonString)
end

function TCVoltsToTemp(TCType::Cint, TCVolts::Cdouble, CJTempK::Cdouble, pTCTempK::Ref{Cdouble})
    ccall((:LJM_TCVoltsToTemp, :libLabJackM), Cint, (Cint, Cdouble, Cdouble, Ref{Cdouble}), TCType, TCVolts, CJTempK, pTCTempK)
end

function FLOAT32ToByteArray(aFLOAT32::Ref{Cfloat}, RegisterOffset::Cint, NumFLOAT32::Cint, aBytes::Ref{Cuchar})
    ccall((:LJM_FLOAT32ToByteArray, :libLabJackM), Cint, (Ref{Cfloat}, Cint, Cint, Ref{Cuchar}), aFLOAT32, RegisterOffset, NumFLOAT32, aBytes)
end

function ByteArrayToFLOAT32(aBytes::Ref{Cuchar}, RegisterOffset::Cint, NumFLOAT32::Cint, aFLOAT32::Ref{Cfloat})
    ccall((:LJM_ByteArrayToFLOAT32, :libLabJackM), Cint, (Ref{Cuchar}, Cint, Cint, Ref{Cfloat}), aBytes, RegisterOffset, NumFLOAT32, aFLOAT32)
end

function UINT16ToByteArray(aUINT16::Ref{UInt16}, RegisterOffset::Cint, NumUINT16::Cint, aBytes::Ref{Cuchar})
    ccall((:LJM_UINT16ToByteArray, :libLabJackM), Cint, (Ref{UInt16}, Cint, Cint, Ref{Cuchar}), aUINT16, RegisterOffset, NumUINT16, aBytes)
end

function ByteArrayToUINT16(aBytes::Ref{Cuchar}, RegisterOffset::Cint, NumUINT16::Cint, aUINT16::Ref{UInt16})
    ccall((:LJM_ByteArrayToUINT16, :libLabJackM), Cint, (Ref{Cuchar}, Cint, Cint, Ref{UInt16}), aBytes, RegisterOffset, NumUINT16, aUINT16)
end

function UINT32ToByteArray(aUINT32::Ref{UInt32}, RegisterOffset::Cint, NumUINT32::Cint, aBytes::Ref{Cuchar})
    ccall((:LJM_UINT32ToByteArray, :libLabJackM), Cint, (Ref{UInt32}, Cint, Cint, Ref{Cuchar}), aUINT32, RegisterOffset, NumUINT32, aBytes)
end

function ByteArrayToUINT32(aBytes::Ref{Cuchar}, RegisterOffset::Cint, NumUINT32::Cint, aUINT32::Ref{UInt32})
    ccall((:LJM_ByteArrayToUINT32, :libLabJackM), Cint, (Ref{Cuchar}, Cint, Cint, Ref{UInt32}), aBytes, RegisterOffset, NumUINT32, aUINT32)
end

function INT32ToByteArray(aINT32::Ref{Cint}, RegisterOffset::Cint, NumINT32::Cint, aBytes::Ref{Cuchar})
    ccall((:LJM_INT32ToByteArray, :libLabJackM), Cint, (Ref{Cint}, Cint, Cint, Ref{Cuchar}), aINT32, RegisterOffset, NumINT32, aBytes)
end

function ByteArrayToINT32(aBytes::Ref{Cuchar}, RegisterOffset::Cint, NumINT32::Cint, aINT32::Ref{Cint})
    ccall((:LJM_ByteArrayToINT32, :libLabJackM), Cint, (Ref{Cuchar}, Cint, Cint, Ref{Cint}), aBytes, RegisterOffset, NumINT32, aINT32)
end

function NumberToIP(Number::UInt32, IPv4String)
    ccall((:LJM_NumberToIP, :libLabJackM), Cint, (UInt32, Cstring), Number, IPv4String)
end

function IPToNumber(IPv4String, Number::Ref{UInt32})
    ccall((:LJM_IPToNumber, :libLabJackM), Cint, (Cstring, Ref{UInt32}), IPv4String, Number)
end

function NumberToMAC(Number::Culonglong, MACString)
    ccall((:LJM_NumberToMAC, :libLabJackM), Cint, (Culonglong, Cstring), Number, MACString)
end

function MACToNumber(MACString, Number::Ref{Culonglong})
    ccall((:LJM_MACToNumber, :libLabJackM), Cint, (Cstring, Ref{Culonglong}), MACString, Number)
end

function GetHostTick()
    ccall((:LJM_GetHostTick, :libLabJackM), Cint, ())
end

function GetHostTick32Bit(TickUpper::Ref{UInt32}, TickLower::Ref{UInt32})
    ccall((:LJM_GetHostTick32Bit, :libLabJackM), Cint, (Ref{UInt32}, Ref{UInt32}), TickUpper, TickLower)
end

function StartInterval(IntervalHandle::Cint, Microseconds::Cint)
    ccall((:LJM_StartInterval, :libLabJackM), Cint, (Cint, Cint), IntervalHandle, Microseconds)
end

function WaitForNextInterval(IntervalHandle::Cint, SkippedIntervals::Ref{Cint})
    ccall((:LJM_WaitForNextInterval, :libLabJackM), Cint, (Cint, Ref{Cint}), IntervalHandle, SkippedIntervals)
end

function CleanInterval(IntervalHandle::Cint)
    ccall((:LJM_CleanInterval, :libLabJackM), Cint, (Cint,), IntervalHandle)
end

function WriteLibraryConfigS(Parameter, Value::Cdouble)
    ccall((:LJM_WriteLibraryConfigS, :libLabJackM), Cint, (Cstring, Cdouble), Parameter, Value)
end

function WriteLibraryConfigStringS(Parameter, String)
    ccall((:LJM_WriteLibraryConfigStringS, :libLabJackM), Cint, (Cstring, Cstring), Parameter, String)
end

function ReadLibraryConfigS(Parameter, Value::Ref{Cdouble})
    ccall((:LJM_ReadLibraryConfigS, :libLabJackM), Cint, (Cstring, Ref{Cdouble}), Parameter, Value)
end

function ReadLibraryConfigStringS(Parameter, String)
    ccall((:LJM_ReadLibraryConfigStringS, :libLabJackM), Cint, (Cstring, Cstring), Parameter, String)
end

function LoadConfigurationFile(FileName)
    ccall((:LJM_LoadConfigurationFile, :libLabJackM), Cint, (Cstring,), FileName)
end

function GetSpecificIPsInfo(InfoHandle::Ref{Cint}, Info::Ref{Cstring})
    ccall((:LJM_GetSpecificIPsInfo, :libLabJackM), Cint, (Ref{Cint}, Ref{Cstring}), InfoHandle, Info)
end

function GetDeepSearchInfo(InfoHandle::Ref{Cint}, Info::Ref{Cstring})
    ccall((:LJM_GetDeepSearchInfo, :libLabJackM), Cint, (Ref{Cint}, Ref{Cstring}), InfoHandle, Info)
end

function Log(Level::Cint, String)
    ccall((:LJM_Log, :libLabJackM), Cint, (Cint, Cstring), Level, String)
end

function ResetLog()
    ccall((:LJM_ResetLog, :libLabJackM), Cint, ())
end

function RegisterDeviceReconnectCallback(Handle::Cint, Callback::LJM_DeviceReconnectCallback)
    ccall((:LJM_RegisterDeviceReconnectCallback, :libLabJackM), Cint, (Cint, LJM_DeviceReconnectCallback), Handle, Callback)
end
