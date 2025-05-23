# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AURORA_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_DFX_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HEADER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUMBER_PACKET" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PAYLOAD_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RECOGNIZE_ROUTER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TTL_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.ADDR_WIDTH { PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to update ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_WIDTH { PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to validate ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.AURORA_DATA_WIDTH { PARAM_VALUE.AURORA_DATA_WIDTH } {
	# Procedure called to update AURORA_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AURORA_DATA_WIDTH { PARAM_VALUE.AURORA_DATA_WIDTH } {
	# Procedure called to validate AURORA_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_DFX_WIDTH { PARAM_VALUE.DATA_DFX_WIDTH } {
	# Procedure called to update DATA_DFX_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_DFX_WIDTH { PARAM_VALUE.DATA_DFX_WIDTH } {
	# Procedure called to validate DATA_DFX_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.HEADER_WIDTH { PARAM_VALUE.HEADER_WIDTH } {
	# Procedure called to update HEADER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HEADER_WIDTH { PARAM_VALUE.HEADER_WIDTH } {
	# Procedure called to validate HEADER_WIDTH
	return true
}

proc update_PARAM_VALUE.NUMBER_PACKET { PARAM_VALUE.NUMBER_PACKET } {
	# Procedure called to update NUMBER_PACKET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_PACKET { PARAM_VALUE.NUMBER_PACKET } {
	# Procedure called to validate NUMBER_PACKET
	return true
}

proc update_PARAM_VALUE.PAYLOAD_WIDTH { PARAM_VALUE.PAYLOAD_WIDTH } {
	# Procedure called to update PAYLOAD_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PAYLOAD_WIDTH { PARAM_VALUE.PAYLOAD_WIDTH } {
	# Procedure called to validate PAYLOAD_WIDTH
	return true
}

proc update_PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH { PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH } {
	# Procedure called to update RECOGNIZE_ROUTER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH { PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH } {
	# Procedure called to validate RECOGNIZE_ROUTER_WIDTH
	return true
}

proc update_PARAM_VALUE.TTL_WIDTH { PARAM_VALUE.TTL_WIDTH } {
	# Procedure called to update TTL_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TTL_WIDTH { PARAM_VALUE.TTL_WIDTH } {
	# Procedure called to validate TTL_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.ADDR_WIDTH { MODELPARAM_VALUE.ADDR_WIDTH PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_WIDTH}] ${MODELPARAM_VALUE.ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_DFX_WIDTH { MODELPARAM_VALUE.DATA_DFX_WIDTH PARAM_VALUE.DATA_DFX_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_DFX_WIDTH}] ${MODELPARAM_VALUE.DATA_DFX_WIDTH}
}

proc update_MODELPARAM_VALUE.RECOGNIZE_ROUTER_WIDTH { MODELPARAM_VALUE.RECOGNIZE_ROUTER_WIDTH PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH}] ${MODELPARAM_VALUE.RECOGNIZE_ROUTER_WIDTH}
}

proc update_MODELPARAM_VALUE.NUMBER_PACKET { MODELPARAM_VALUE.NUMBER_PACKET PARAM_VALUE.NUMBER_PACKET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_PACKET}] ${MODELPARAM_VALUE.NUMBER_PACKET}
}

proc update_MODELPARAM_VALUE.TTL_WIDTH { MODELPARAM_VALUE.TTL_WIDTH PARAM_VALUE.TTL_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TTL_WIDTH}] ${MODELPARAM_VALUE.TTL_WIDTH}
}

proc update_MODELPARAM_VALUE.HEADER_WIDTH { MODELPARAM_VALUE.HEADER_WIDTH PARAM_VALUE.HEADER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HEADER_WIDTH}] ${MODELPARAM_VALUE.HEADER_WIDTH}
}

proc update_MODELPARAM_VALUE.AURORA_DATA_WIDTH { MODELPARAM_VALUE.AURORA_DATA_WIDTH PARAM_VALUE.AURORA_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AURORA_DATA_WIDTH}] ${MODELPARAM_VALUE.AURORA_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.PAYLOAD_WIDTH { MODELPARAM_VALUE.PAYLOAD_WIDTH PARAM_VALUE.PAYLOAD_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PAYLOAD_WIDTH}] ${MODELPARAM_VALUE.PAYLOAD_WIDTH}
}

