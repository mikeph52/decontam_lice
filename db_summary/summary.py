import sys
import json

sizes, count = [], 0
for line in sys.stdin:
    d = json.loads(line)
    count += 1
    sizes.append(d.get('assembly_stats', {}).get('total_sequence_length', 0))
print(f'Assemblies: {count}')
print(f'Total bases: {sum(sizes):,}')
print(f'Approx size: {sum(sizes)/1e9:.1f} GB (uncompressed)')