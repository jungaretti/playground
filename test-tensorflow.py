import tensorflow
import sys

if len(tensorflow.config.list_physical_devices("GPU")) > 0:
    print("GPU available: " + tensorflow.test.gpu_device_name())
else:
    print("GPU not available")
    sys.exit(1)
