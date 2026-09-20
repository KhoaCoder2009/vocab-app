import re

# Read the file
with open('ielts_50_topics.sql', 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to match: select null, 'TITLE', 'DESC', 'DIFF', bool, 'COLOR', 'CATEGORY', 'TOPIC'
# We need to add category and topic before the WHERE clause

# Find all patterns like: select null, 'Title', 'Description', 'difficulty', true/false, 'color'
pattern = r"(select null, '([^']+)', '[^']+', '[^']+', (?:true|false), '([^']+)')"

def replacer(match):
    full_match = match.group(1)
    title = match.group(2)
    color = match.group(3)
    
    # Extract topic from title
    if 'Work & Jobs' in title:
        topic = 'Work & Jobs'
    elif 'Education' in title:
        topic = 'Education'
    elif 'Technology' in title:
        topic = 'Technology'
    elif 'Travel' in title:
        topic = 'Travel & Tourism'
    elif 'Health' in title:
        topic = 'Health & Fitness'
    elif 'Environment' in title:
        topic = 'Environment'
    elif 'Food' in title:
        topic = 'Food & Cooking'
    elif 'Family' in title:
        topic = 'Family & Relationships'
    elif 'Sports' in title:
        topic = 'Sports & Hobbies'
    elif 'Art' in title or 'Music' in title:
        topic = 'Arts & Culture'
    elif 'Shopping' in title:
        topic = 'Shopping & Fashion'
    elif 'Media' in title or 'News' in title:
        topic = 'Media & Communication'
    elif 'City' in title or 'Country' in title:
        topic = 'Places & Living'
    elif 'Weather' in title or 'Seasons' in title:
        topic = 'Weather & Seasons'
    elif 'Transportation' in title or 'Transport' in title:
        topic = 'Transportation'
    elif 'Money' in title or 'Finance' in title:
        topic = 'Money & Finance'
    elif 'Crime' in title or 'Law' in title:
        topic = 'Crime & Law'
    elif 'Science' in title:
        topic = 'Science & Research'
    elif 'Animals' in title or 'Pets' in title:
        topic = 'Animals & Pets'
    elif 'Happiness' in title or 'Emotions' in title:
        topic = 'Emotions & Feelings'
    else:
        # Generic extraction from title
        topic = title.replace('IELTS ', '').strip()
    
    return full_match + ", 'IELTS Band 4.0-6.0', '" + topic + "'"

# Replace
new_content = re.sub(pattern, replacer, content)

# Write back
with open('ielts_50_topics.sql', 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Updated ielts_50_topics.sql with category and topic fields")
