from cffi import FFI
from fibstacklib_cffi import lib as fib

class FibstackDevice:
    """
    A class used to represent a Device on a Fibstack board.
    
    Attributes
    ----------
    id: 
        The device ID on a Fibstack board
    description:
        The description of the Device
    is_read_only:
        Specifies whatever the device is Read-Only. If the Device is not Read-Only,
        then the user can set the value from the FibstackBoard class
    value_type:
        Specifies the type of value this Device stores
    value:
        The value this Device stores. 
    """
    
    __ffi = FFI()
    
    def __init__(self, internal_board_struct, device_id):
        """
        The FibstackDevice class constructor.
        
        If the Device ID is invalid, the constructor will throw a ValueError exception.
        
        Parameters
        ----------
        :param internal_board_struct:
            An internal C structure that contains board information
        :param device_id:
            The Device ID
        
        """
        total_devices = fib.fibstack_board_get_device_number(internal_board_struct)
        if device_id < 0 or device_id >= total_devices:
            error_message = 'Device ID [{0}] is invalid.'.format(device_id)
            raise ValueError(error_message)
        
        description = fib.fibstack_board_get_device_description(internal_board_struct, device_id)
        is_read_only = fib.fibstack_board_is_device_read_only(internal_board_struct, device_id)
        device_type = fib.fibstack_board_get_device_value_type(internal_board_struct, device_id)
        boolean_value = fib.fibstack_board_get_boolean(internal_board_struct, device_id)
        integer_value = fib.fibstack_board_get_integer(internal_board_struct, device_id)
        
        self.id = device_id
        self.description = str(self.__ffi.string(description), "utf-8")
        self.is_read_only = True if is_read_only == 1 else False
        
        if device_type == fib.BOOLEAN_TYPE:
            self.value_type = 'BOOLEAN'
            self.value = True if boolean_value == 1 else False
        elif device_type == fib.INTEGER_TYPE:
            self.value_type = 'INTEGER'
            self.value = integer_value
        else:
            self.value_type = 'UNKNOWN'

    def to_JSON(self):
        """Returns the JSON representation of the FibstackDevice object."""
        return { "id": self.id, "description": self.description, "is_read_only": self.is_read_only, "value_type": self.value_type, "value": self.value }
