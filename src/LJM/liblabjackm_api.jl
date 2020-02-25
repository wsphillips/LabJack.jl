
function ListAll(DeviceType::LJDeviceType, ConnectionType::LJConnectionType, NumFound::Ref{Int32}, aDeviceTypes::Vector{Int32}, aConnectionTypes::Vector{Int32}, aSerialNumbers::Vector{Int32}, aIPAddresses::Vector{Int32})
    ccall((:LJM_ListAll, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), DeviceType, ConnectionType, NumFound, aDeviceTypes, aConnectionTypes, aSerialNumbers, aIPAddresses)
end

function ListAllS(DeviceType::LJDeviceType, ConnectionType::LJConnectionType, NumFound::Ref{Int32}, aDeviceTypes::Vector{Int32}, aConnectionTypes::Vector{Int32}, aSerialNumbers::Vector{Int32}, aIPAddresses::Vector{Int32})
    ccall((:LJM_ListAllS, :libLabJackM), Cint, (Cstring, Cstring, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}), DeviceType, ConnectionType, NumFound, aDeviceTypes, aConnectionTypes, aSerialNumbers, aIPAddresses)
end

function ListAllExtended(DeviceType::Cint, ConnectionType::Cint, NumAddresses::Cint, aAddresses::Ref{Cint}, aNumRegs::Ref{Cint}, MaxNumFound::Cint, NumFound::Ref{Cint}, aDeviceTypes::Ref{Cint}, aConnectionTypes::Ref{Cint}, aSerialNumbers::Ref{Cint}, aIPAddresses::Ref{Cint}, aBytes::Ref{Cuchar})
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

function eWriteAddress(Handle::Cint, Address::Cint, Type::Cint, Value::Cdouble)
    ccall((:LJM_eWriteAddress, :libLabJackM), Cint, (Cint, Cint, Cint, Cdouble), Handle, Address, Type, Value)
end

function eReadAddress(Handle::Cint, Address::Cint, Type::Cint, Value::Ref{Cdouble})
    ccall((:LJM_eReadAddress, :libLabJackM), Cint, (Cint, Cint, Cint, Ref{Cdouble}), Handle, Address, Type, Value)
end

function eWriteName(Handle::Cint, Name::String, Value::Float64)
    ccall((:LJM_eWriteName, :libLabJackM), Cint, (Cint, Cstring, Cdouble), Handle, Name, Value)
end

function eReadName(Handle::Cint, Name::String, Value::Ref{Float64})
    ccall((:LJM_eReadName, :libLabJackM), Cint, (Cint, Cstring, Ref{Cdouble}), Handle, Name, Value)
end

function eReadAddresses(Handle::Cint, NumFrames::Cint, aAddresses::Ref{Cint}, aTypes::Ref{Cint}, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadAddresses, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aAddresses, aTypes, aValues, ErrorAddress)
end

function eReadNames(Handle::Cint, NumFrames::Cint, aNames::Ref{Cstring}, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadNames, :libLabJackM), Cint, (Cint, Cint, Ref{Cstring}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aNames, aValues, ErrorAddress)
end

function eWriteAddresses(Handle::Cint, NumFrames::Cint, aAddresses::Ref{Cint}, aTypes::Ref{Cint}, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteAddresses, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aAddresses, aTypes, aValues, ErrorAddress)
end

function eWriteNames(Handle::Cint, NumFrames::Cint, aNames::Ref{Cstring}, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteNames, :libLabJackM), Cint, (Cint, Cint, Ref{Cstring}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aNames, aValues, ErrorAddress)
end

function eReadAddressArray(Handle::Cint, Address::Cint, Type::Cint, NumValues::Cint, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadAddressArray, :libLabJackM), Cint, (Cint, Cint, Cint, Cint, Ref{Cdouble}, Ref{Cint}), Handle, Address, Type, NumValues, aValues, ErrorAddress)
end

function eReadNameArray(Handle::Cint, Name, NumValues::Cint, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadNameArray, :libLabJackM), Cint, (Cint, Cstring, Cint, Ref{Cdouble}, Ref{Cint}), Handle, Name, NumValues, aValues, ErrorAddress)
end

function eWriteAddressArray(Handle::Cint, Address::Cint, Type::Cint, NumValues::Cint, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteAddressArray, :libLabJackM), Cint, (Cint, Cint, Cint, Cint, Ref{Cdouble}, Ref{Cint}), Handle, Address, Type, NumValues, aValues, ErrorAddress)
end

function eWriteNameArray(Handle::Cint, Name, NumValues::Cint, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteNameArray, :libLabJackM), Cint, (Cint, Cstring, Cint, Ref{Cdouble}, Ref{Cint}), Handle, Name, NumValues, aValues, ErrorAddress)
end

function eReadAddressByteArray(Handle::Cint, Address::Cint, NumBytes::Cint, aBytes, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadAddressByteArray, :libLabJackM), Cint, (Cint, Cint, Cint, Cstring, Ref{Cint}), Handle, Address, NumBytes, aBytes, ErrorAddress)
end

function eReadNameByteArray(Handle::Cint, Name, NumBytes::Cint, aBytes, ErrorAddress::Ref{Cint})
    ccall((:LJM_eReadNameByteArray, :libLabJackM), Cint, (Cint, Cstring, Cint, Cstring, Ref{Cint}), Handle, Name, NumBytes, aBytes, ErrorAddress)
end

function eWriteAddressByteArray(Handle::Cint, Address::Cint, NumBytes::Cint, aBytes, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteAddressByteArray, :libLabJackM), Cint, (Cint, Cint, Cint, Cstring, Ref{Cint}), Handle, Address, NumBytes, aBytes, ErrorAddress)
end

function eWriteNameByteArray(Handle::Cint, Name, NumBytes::Cint, aBytes, ErrorAddress::Ref{Cint})
    ccall((:LJM_eWriteNameByteArray, :libLabJackM), Cint, (Cint, Cstring, Cint, Cstring, Ref{Cint}), Handle, Name, NumBytes, aBytes, ErrorAddress)
end

function eAddresses(Handle::Cint, NumFrames::Cint, aAddresses::Ref{Cint}, aTypes::Ref{Cint}, aWrites::Ref{Cint}, aNumValues::Ref{Cint}, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eAddresses, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aAddresses, aTypes, aWrites, aNumValues, aValues, ErrorAddress)
end

function eNames(Handle::Cint, NumFrames::Cint, aNames::Ref{Cstring}, aWrites::Ref{Cint}, aNumValues::Ref{Cint}, aValues::Ref{Cdouble}, ErrorAddress::Ref{Cint})
    ccall((:LJM_eNames, :libLabJackM), Cint, (Cint, Cint, Ref{Cstring}, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}), Handle, NumFrames, aNames, aWrites, aNumValues, aValues, ErrorAddress)
end

function eReadNameString(Handle::Cint, Name, String)
    ccall((:LJM_eReadNameString, :libLabJackM), Cint, (Cint, Cstring, Cstring), Handle, Name, String)
end

function eReadAddressString(Handle::Cint, Address::Cint, String)
    ccall((:LJM_eReadAddressString, :libLabJackM), Cint, (Cint, Cint, Cstring), Handle, Address, String)
end

function eWriteNameString(Handle::Cint, Name, String)
    ccall((:LJM_eWriteNameString, :libLabJackM), Cint, (Cint, Cstring, Cstring), Handle, Name, String)
end

function eWriteAddressString(Handle::Cint, Address::Cint, String)
    ccall((:LJM_eWriteAddressString, :libLabJackM), Cint, (Cint, Cint, Cstring), Handle, Address, String)
end

function eStreamStart(Handle::Cint, ScansPerRead::Cint, NumAddresses::Cint, aScanList::Ref{Cint}, ScanRate::Ref{Cdouble})
    ccall((:LJM_eStreamStart, :libLabJackM), Cint, (Cint, Cint, Cint, Ref{Cint}, Ref{Cdouble}), Handle, ScansPerRead, NumAddresses, aScanList, ScanRate)
end

function eStreamRead(Handle::Cint, aData::Ref{Cdouble}, DeviceScanBacklog::Ref{Cint}, LJMScanBacklog::Ref{Cint})
    ccall((:LJM_eStreamRead, :libLabJackM), Cint, (Cint, Ref{Cdouble}, Ref{Cint}, Ref{Cint}), Handle, aData, DeviceScanBacklog, LJMScanBacklog)
end

function SetStreamCallback(Handle::Cint, Callback::LJM_StreamReadCallback, Arg::Ref{Cvoid})
    ccall((:LJM_SetStreamCallback, :libLabJackM), Cint, (Cint, LJM_StreamReadCallback, Ref{Cvoid}), Handle, Callback, Arg)
end

function eStreamStop(Handle::Cint)
    ccall((:LJM_eStreamStop, :libLabJackM), Cint, (Cint,), Handle)
end

function StreamBurst(Handle::Cint, NumAddresses::Cint, aScanList::Ref{Cint}, ScanRate::Ref{Cdouble}, NumScans::UInt32, aData::Ref{Cdouble})
    ccall((:LJM_StreamBurst, :libLabJackM), Cint, (Cint, Cint, Ref{Cint}, Ref{Cdouble}, UInt32, Ref{Cdouble}), Handle, NumAddresses, aScanList, ScanRate, NumScans, aData)
end

function GetStreamTCPReceiveBufferStatus(Handle::Cint, ReceiveBufferBytesSize::Ref{UInt32}, ReceiveBufferBytesBacklog::Ref{UInt32})
    ccall((:LJM_GetStreamTCPReceiveBufferStatus, :libLabJackM), Cint, (Cint, Ref{UInt32}, Ref{UInt32}), Handle, ReceiveBufferBytesSize, ReceiveBufferBytesBacklog)
end

function WriteRaw(Handle::Cint, Data::Ref{Cuchar}, NumBytes::Cint)
    ccall((:LJM_WriteRaw, :libLabJackM), Cint, (Cint, Ref{Cuchar}, Cint), Handle, Data, NumBytes)
end

function ReadRaw(Handle::Cint, Data::Ref{Cuchar}, NumBytes::Cint)
    ccall((:LJM_ReadRaw, :libLabJackM), Cint, (Cint, Ref{Cuchar}, Cint), Handle, Data, NumBytes)
end

function AddressesToMBFB(MaxBytesPerMBFB::Cint, aAddresses::Ref{Cint}, aTypes::Ref{Cint}, aWrites::Ref{Cint}, aNumValues::Ref{Cint}, aValues::Ref{Cdouble}, NumFrames::Ref{Cint}, aMBFBCommand::Ref{Cuchar})
    ccall((:LJM_AddressesToMBFB, :libLabJackM), Cint, (Cint, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cint}, Ref{Cdouble}, Ref{Cint}, Ref{Cuchar}), MaxBytesPerMBFB, aAddresses, aTypes, aWrites, aNumValues, aValues, NumFrames, aMBFBCommand)
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

function AddressesToTypes(NumAddresses::Cint, aAddresses::Ref{Cint}, aTypes::Ref{Cint})
    ccall((:LJM_AddressesToTypes, :libLabJackM), Cint, (Cint, Ref{Cint}, Ref{Cint}), NumAddresses, aAddresses, aTypes)
end

function AddressToType(Address::Cint, Type::Ref{Cint})
    ccall((:LJM_AddressToType, :libLabJackM), Cint, (Cint, Ref{Cint}), Address, Type)
end

function LookupConstantValue(Scope, ConstantName, ConstantValue::Ref{Cdouble})
    ccall((:LJM_LookupConstantValue, :libLabJackM), Cint, (Cstring, Cstring, Ref{Cdouble}), Scope, ConstantName, ConstantValue)
end

function LookupConstantName(Scope, ConstantValue::Cdouble, ConstantName)
    ccall((:LJM_LookupConstantName, :libLabJackM), Cint, (Cstring, Cdouble, Cstring), Scope, ConstantValue, ConstantName)
end

function ErrorToString(ErrorCode::Integer, ErrorString)
    ccall((:LJM_ErrorToString, :libLabJackM), Cint, (Cint, Cstring), ErrorCode, ErrorString)
end

function LoadConstants()
    ccall((:LJM_LoadConstants, :libLabJackM), Cint, ())
end

function LoadConstantsFromFile(FileName)
    ccall((:LJM_LoadConstantsFromFile, :libLabJackM), Cint, (Cstring,), FileName)
end

function LoadConstantsFromString(JsonString)
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
