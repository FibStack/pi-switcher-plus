from cffi import FFI
from fibstacklib_cffi import lib as fib
from fibstacklibpy import FibstackDevice

class FibstackBoard:
    """
    This class represents a Fibstack Board connected to this board computer.

    Attributes
    ----------
    address:
        The I2C address of the Fibstack Board
    description:
        A short description of the Fibstack Board
    total_devices:
        The number of total Devices this Board has
    """

    __ffi = FFI()

    def __init__(self, board):
        """
        FibstackBoard class constructor.

        Parameters
        ----------
        :param board:
            An internal C structure that contains board information
        """
        self.__board = board
        self.update()

    def update(self):
        """Updates the information from the Fibstack Board."""
        fib.fibstack_board_update(self.__board)
        description = fib.fibstack_board_get_description(self.__board)

        self.address = fib.fibstack_board_get_address(self.__board)
        self.total_devices = fib.fibstack_board_get_device_number(self.__board)
        self.description = str(self.__ffi.string(description), "utf-8")

    def set_address(self, new_address):
        """
        Sets the Fibstack Board I2C address.
        
        
        Parameters
        ----------
        :param new_address: 
            The new address to be set
        """
        result = fib.fibstack_board_set_address(self.__board, new_address)
        if result > 0:
            self.address = result
        else:
            error_message = 'The provided [{0}] is invalid.'.format(new_address)
            raise ValueError(error_message)
        return result

    def set_device_value(self, device_id, new_value):
        """
        Sets the specified value to the Device.

        If the Device Id or the new value is invalid, or the Device is
        Read-Only, the method will raise the ValueError exception.

        Parameters
        ----------
        :param device_id:
            The Device Id
        :param new_value:
            The new value to be set.
        """
        if device_id >= 0 and device_id < self.total_devices:
            is_read_only = True if fib.fibstack_board_is_device_read_only(self.__board, device_id) == 1 else False
            if is_read_only:
                error_message = 'Device ID [{0}] is Read Only and cannot be set.'.format(device_id)
                raise ValueError(error_message)

            device_type = fib.fibstack_board_get_device_value_type(self.__board, device_id)
            if device_type == fib.BOOLEAN_TYPE:
                self.__set_boolean(device_id, new_value)
        else:
            error_message = 'Device ID [{0}] is invalid.'.format(device_id)
            raise ValueError(error_message)

    def __set_boolean(self, device_id, new_value):
        new_boolean_value = 0
        if new_value == True:
            new_boolean_value = 1
        elif new_value == False:
            new_boolean_value = 0
        elif new_value == 1 or new_value == 0:
            new_boolean_value = new_value
        else:
            error_message = 'Invalid value [{0}] for Boolean device type.'.format(new_value)
            raise ValueError(error_message)
        fib.fibstack_board_set_boolean(self.__board, device_id, new_boolean_value)


    def get_device(self, device_id):
        """
        Returns a FibstackDevice instance for the specified Device Id.

        Parameters
        ----------
        :param device_id:
            The Device Id

        """
        fib.fibstack_board_update(self.__board)
        device = FibstackDevice(self.__board, device_id)
        return device

    def get_devices(self):
        """Returns a list of devices that the current Fibstack Board has."""
        devices = []
        total_devices = fib.fibstack_board_get_device_number(self.__board)
        for device_id in range(total_devices):
            devices.append(self.get_device(device_id))
        return devices

    def to_JSON(self):
        """Returns the JSON representation of the FibstackBoard object."""
        all_devices = []
        for device in self.get_devices():
            all_devices.append(device.to_JSON())
        return { "address": self.address, "total_devices": self.total_devices, "description": self.description, "devices": all_devices }
