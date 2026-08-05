from pathlib import Path
import re

root = Path('lib/features')

for path in root.glob('*/data/datasources/*.dart'):
    text = path.read_text(encoding='utf-8')
    if "import '../models/_model.dart';" not in text:
        text = "import '../models/_model.dart';\n\n" + text
        path.write_text(text, encoding='utf-8')

for path in root.glob('*/presentation/pages/_page.dart'):
    feature = path.parent.parent.name
    class_name = ''.join(part.capitalize() for part in feature.split('_')) + 'Page'
    screen_name = ''.join(part.capitalize() for part in feature.split('_')) + 'Screen'
    content = (
        "import 'package:flutter/material.dart';\n"
        f"import '../screens/{feature}_screen.dart';\n\n"
        f"class {class_name} extends StatelessWidget {{\n"
        f"  const {class_name}({{super.key}});\n\n"
        "  @override\n"
        "  Widget build(BuildContext context) {\n"
        f"    return const {screen_name}();\n"
        "  }\n"
        "}\n"
    )
    path.write_text(content, encoding='utf-8')

for path in root.glob('*/presentation/screens/*_screen.dart'):
    text = path.read_text(encoding='utf-8')
    text = re.sub(r'\bclass\s+([A-Za-z0-9_]+)_screen\b', r'class \1Screen', text)
    path.write_text(text, encoding='utf-8')
