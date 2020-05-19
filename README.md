# swift-root
Container with Swift + Python + TensorFlow + ROOT 6.20/04

To run dockerhub build:
```
docker run --rm -p 8888:8888 ponyisi/swift-root
```

The container will run a Jupyter server with (among others) the kernel `Swift-ROOT-Py2`, which is what you need.

At the moment, you will need to manually run the following to load ROOT:

```
import PythonKit
let sys=Python.import("sys")
let os=Python.import("os")
sys.path.append("/root/root/lib")
let ROOT = Python.import("ROOT")
```
This will get fixed in the future.
