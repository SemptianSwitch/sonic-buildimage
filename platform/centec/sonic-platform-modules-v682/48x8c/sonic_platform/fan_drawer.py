#!/usr/bin/env python

########################################################################
# Centec V682 48X8C
#
# Module contains an implementation of SONiC Platform Base API and
# provides the Fan-Drawers' information available in the platform.
#
########################################################################

try:
    from sonic_platform_base.fan_drawer_base import FanDrawerBase
    from sonic_platform.fan import Fan
except ImportError as e:
    raise ImportError(str(e) + "- required module not found")

CENTEC_FANS_PER_FANTRAY = 4


class FanDrawer(FanDrawerBase):
    """Centec V682 48X8C Platform-specific Fan class"""

    def __init__(self, fantray_index):

        FanDrawerBase.__init__(self)
        self.fantrayindex = fantray_index
        for i in range(CENTEC_FANS_PER_FANTRAY):
            self._fan_list.append(Fan(fantray_index, i))

    def get_name(self):
        """
        Retrieves the fan drawer name
        Returns:
            string: The name of the device
        """
        return "FanTray{}".format(self.fantrayindex)

    def set_status_led(self, color):
        """
        Sets the state of the fan drawer status LED

        Args:
            color: A string representing the color with which to set the
                   fan drawer status LED

        Returns:
            bool: True if status LED state is set successfully, False if not
        """
        return True
