import torch
import sys

if torch.cuda.is_available():
    print("GPU available: " + torch.cuda.get_device_name(0))
else:
    print("GPU not available")
    sys.exit(1)
