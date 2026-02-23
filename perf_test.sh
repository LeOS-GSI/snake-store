#!/bin/bash

echo "=== Performance Comparison: g++ vs clang ==="
echo "Binary sizes:"
echo "g++ build:   $(du -h build/snake-store | cut -f1)"
echo "clang build: $(du -h build-clang/snake-store | cut -f1)"
echo ""

echo "=== Running g++ build (3 times) ==="
for i in {1..3}; do
    echo "--- Run $i ---"
    timeout 10s build/snake-store --help 2>&1 | grep -E "(Timer|ms)" || echo "No timing output in help"
done

echo ""
echo "=== Running clang build (3 times) ==="
for i in {1..3}; do
    echo "--- Run $i ---"
    timeout 10s build-clang/snake-store --help 2>&1 | grep -E "(Timer|ms)" || echo "No timing output in help"
done

echo ""
echo "=== Binary analysis ==="
echo "g++ build symbols:"
nm -D build/snake-store | wc -l
echo "clang build symbols:"
nm -D build-clang/snake-store | wc -l

echo ""
echo "=== Shared library dependencies ==="
echo "g++ build:"
ldd build/snake-store | wc -l
echo "clang build:"
ldd build-clang/snake-store | wc -l