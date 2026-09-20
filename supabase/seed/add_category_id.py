import re

# Read the file
with open('ielts_50_topics.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to match the INSERT statement
# insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color, category, topic)
pattern = r"insert into public\.vocabulary_sets \(owner_id, title, description, difficulty, is_public, cover_color, category, topic\)"
replacement = "insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color, category, category_id, topic)"

content = re.sub(pattern, replacement, content)

# Now add category_id values
# Pattern: select null, 'TITLE', 'DESC', 'DIFF', bool, 'COLOR', 'CATEGORY', 'TOPIC'
# Need to add category_id after category

def get_category_id(category):
    """Convert category name to category_id"""
    if category == 'IELTS Band 1.0':
        return 'ielts-band-1'
    elif category == 'IELTS Band 2.0':
        return 'ielts-band-2'
    elif category == 'IELTS Band 3.0':
        return 'ielts-band-3'
    elif category == 'IELTS Band 4.0-5.0':
        return 'ielts-band-4-5'
    elif category == 'IELTS Band 5.0-6.0':
        return 'ielts-band-5-6'
    elif category == 'IELTS Band 6.0-7.0':
        return 'ielts-band-6-7'
    elif category == 'IELTS Band 7.0-8.0':
        return 'ielts-band-7-8'
    elif category == 'IELTS Band 8.0-9.0':
        return 'ielts-band-8-9'
    elif category == 'IELTS Band 9.0':
        return 'ielts-band-9'
    elif category == 'English 10':
        return 'english-10'
    elif category == 'English 11':
        return 'english-11'
    elif category == 'English 12':
        return 'english-12'
    else:
        return 'other'

# Pattern to find: select null, 'title', 'desc', 'diff', bool, 'color', 'CATEGORY', 'TOPIC'
select_pattern = r"select null, '[^']+', '[^']+', '[^']+', (?:true|false), '[^']+', '([^']+)', '([^']+)'"

def add_category_id(match):
    category = match.group(1)
    topic = match.group(2)
    category_id = get_category_id(category)
    
    # Replace the entire match with new version including category_id
    original = match.group(0)
    # Insert category_id after category (before last topic)
    new_version = original.rsplit(", '", 1)[0] + f", '{category_id}', '" + original.rsplit(", '", 1)[1]
    return new_version

content = re.sub(select_pattern, add_category_id, content)

# Write back
with open('ielts_50_topics.sql', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ Updated ielts_50_topics.sql with category_id field")
