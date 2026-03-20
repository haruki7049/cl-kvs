(asdf:defystem "kvs"
  :author "haruki7049"
  :class :package-inferred-system
  :depends-on ("kvs/main")
  :entry-point "kvs/main:main"
  :build-operation "program-op"
  :build-pathname "bin/cl-kvs")
