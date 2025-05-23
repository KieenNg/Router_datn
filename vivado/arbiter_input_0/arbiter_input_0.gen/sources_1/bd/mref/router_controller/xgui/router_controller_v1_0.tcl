# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AURORA_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUMBER_PACKET" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RECOGNIZE_ROUTER_WIDTH" -parent ${Page_0}


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

proc update_PARAM_VALUE.NUMBER_PACKET { PARAM_VALUE.NUMBER_PACKET } {
	# Procedure called to update NUMBER_PACKET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_PACKET { PARAM_VALUE.NUMBER_PACKET } {
	# Procedure called to validate NUMBER_PACKET
	return true
}

proc update_PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH { PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH } {
	# Procedure called to update RECOGNIZE_ROUTER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH { PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH } {
	# Procedure called to validate RECOGNIZE_ROUTER_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.AURORA_DATA_WIDTH { MODELPARAM_VALUE.AURORA_DATA_WIDTH PARAM_VALUE.AURORA_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AURORA_DATA_WIDTH}] ${MODELPARAM_VALUE.AURORA_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.ADDR_WIDTH { MODELPARAM_VALUE.ADDR_WIDTH PARAM_VALUE.ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_WIDTH}] ${MODELPARAM_VALUE.ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.NUMBER_PACKET { MODELPARAM_VALUE.NUMBER_PACKET PARAM_VALUE.NUMBER_PACKET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_PACKET}] ${MODELPARAM_VALUE.NUMBER_PACKET}
}

proc update_MODELPARAM_VALUE.RECOGNIZE_ROUTER_WIDTH { MODELPARAM_VALUE.RECOGNIZE_ROUTER_WIDTH PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RECOGNIZE_ROUTER_WIDTH}] ${MODELPARAM_VALUE.RECOGNIZE_ROUTER_WIDTH}
}

