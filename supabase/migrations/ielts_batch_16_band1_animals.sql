-- BATCH 16 | BAND 1.0 | TOPIC: Animals | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Animals' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Animals',
       'Từ vựng IELTS chủ đề Animals cho Band 1: thú cưng, động vật hoang dã, nông trại và bộ phận cơ thể động vật.',
       'easy', true, 'orange')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Animals' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'animal', 'động vật', 'a living thing that is not a plant or person', 'noun', '/ˈænɪml/',
     'I like animals very much.', 'Tôi rất thích động vật.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening', 'Writing'],
     array['wild animal', 'farm animal', 'protect animals'],
     array['creature'],
     array[]::text[],
     array['animals'],
     'Wild animal là động vật hoang dã.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pet', 'thú cưng', 'an animal kept at home', 'noun', '/pet/',
     'My favourite pet is a dog.', 'Thú cưng yêu thích của tôi là con chó.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['keep a pet', 'have a pet', 'pet shop'],
     array[]::text[],
     array[]::text[],
     array['petting'],
     'Have a pet là nuôi thú cưng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'dog', 'con chó', 'an animal often kept as a pet', 'noun', '/dɔːɡ/',
     'My dog runs in the park every morning.', 'Con chó của tôi chạy trong công viên mỗi sáng.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['walk the dog', 'pet dog', 'dog food'],
     array[]::text[],
     array[]::text[],
     array['doggy'],
     'Walk the dog là dắt chó đi dạo.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cat', 'con mèo', 'a small animal often kept as a pet', 'noun', '/kæt/',
     'My cat sleeps all day.', 'Con mèo của tôi ngủ cả ngày.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['pet cat', 'cat food', 'black cat'],
     array[]::text[],
     array[]::text[],
     array['kitten'],
     'Kitten là mèo con.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bird', 'con chim', 'an animal with wings and feathers', 'noun', '/bɜːrd/',
     'The bird sings every morning.', 'Con chim hót mỗi sáng.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening', 'Reading'],
     array['sing like a bird', 'wild bird', 'bird watching'],
     array[]::text[],
     array[]::text[],
     array['birdcage'],
     'Early bird là người dậy sớm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fish', 'con cá', 'an animal that lives and swims in water', 'noun', '/fɪʃ/',
     'We keep fish in a small tank.', 'Chúng tôi nuôi cá trong một bể nhỏ.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['catch fish', 'fresh fish', 'fish tank'],
     array[]::text[],
     array[]::text[],
     array['fishing', 'fisherman'],
     'Số nhiều thường là fish, không phải fishes.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'horse', 'con ngựa', 'a large animal used for riding', 'noun', '/hɔːrs/',
     'My uncle rides a horse.', 'Chú tôi cưỡi ngựa.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['ride a horse', 'wild horse', 'horse race'],
     array[]::text[],
     array[]::text[],
     array['horseback'],
     'Ride a horse là cưỡi ngựa.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cow', 'con bò', 'a large farm animal that gives milk', 'noun', '/kaʊ/',
     'The cow gives us milk.', 'Con bò cho chúng ta sữa.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['milk a cow', 'farm cow', 'cows and pigs'],
     array[]::text[],
     array[]::text[],
     array['cowboy'],
     'Cow là bò cái, bull là bò đực.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pig', 'con lợn', 'a farm animal with a short tail', 'noun', '/pɪɡ/',
     'The farmer has ten pigs.', 'Người nông dân có mười con lợn.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['farm pig', 'pig farm', 'wild pig'],
     array[]::text[],
     array[]::text[],
     array['piglet'],
     'Pork là thịt lợn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'duck', 'con vịt', 'a water bird with a flat beak', 'noun', '/dʌk/',
     'Ducks swim on the lake.', 'Những con vịt bơi trên hồ.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['wild duck', 'swim like a duck', 'duck egg'],
     array[]::text[],
     array[]::text[],
     array['duckling'],
     'Duckling là vịt con.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rabbit', 'con thỏ', 'a small animal with long ears', 'noun', '/ˈræbɪt/',
     'My sister has a white rabbit.', 'Em gái tôi có một con thỏ trắng.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['white rabbit', 'pet rabbit', 'rabbit hole'],
     array['bunny'],
     array[]::text[],
     array['rabbits'],
     'Bunny là cách gọi thân mật.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'elephant', 'con voi', 'a very large grey animal with a long nose', 'noun', '/ˈelɪfənt/',
     'An elephant is the biggest land animal.', 'Con voi là động vật trên cạn lớn nhất.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening', 'Reading'],
     array['African elephant', 'baby elephant', 'elephant trunk'],
     array[]::text[],
     array[]::text[],
     array['elephants'],
     'Trunk là vòi voi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tiger', 'con hổ', 'a large wild cat with stripes', 'noun', '/ˈtaɪɡər/',
     'Tigers live in forests.', 'Hổ sống trong rừng.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['wild tiger', 'tiger cub', 'hungry tiger'],
     array[]::text[],
     array[]::text[],
     array['tigress'],
     'Tiger là biểu tượng của sức mạnh trong nhiều nền văn hoá.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lion', 'con sư tử', 'a large wild cat that lives in Africa', 'noun', '/ˈlaɪən/',
     'The lion is called the king of animals.', 'Sư tử được gọi là chúa tể của muôn loài.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['wild lion', 'lion cub', 'male lion'],
     array[]::text[],
     array[]::text[],
     array['lioness'],
     'Lioness là sư tử cái.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'monkey', 'con khỉ', 'an animal that climbs trees and has a long tail', 'noun', '/ˈmʌŋki/',
     'Monkeys eat bananas.', 'Khỉ ăn chuối.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['wild monkey', 'monkey house', 'funny monkey'],
     array[]::text[],
     array[]::text[],
     array['monkeys'],
     'Monkey thường xuất hiện trong bài hát thiếu nhi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bear', 'con gấu', 'a large heavy wild animal with thick fur', 'noun', '/ber/',
     'Bears sleep through the winter.', 'Gấu ngủ suốt mùa đông.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['brown bear', 'polar bear', 'bear cub'],
     array[]::text[],
     array[]::text[],
     array['bear'],
     'Bear còn là động từ: chịu đựng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'snake', 'con rắn', 'a long thin animal without legs', 'noun', '/sneɪk/',
     'Some snakes are very dangerous.', 'Một số loài rắn rất nguy hiểm.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['poisonous snake', 'wild snake', 'snake bite'],
     array[]::text[],
     array[]::text[],
     array['snakes'],
     'Snake bite là vết rắn cắn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'insect', 'côn trùng', 'a very small animal with six legs', 'noun', '/ˈɪnsekt/',
     'An insect is on the leaf.', 'Một con côn trùng đang đậu trên chiếc lá.',
     1.0, 'Animals', 'A1', 'Reading (Animals).',
     array['Speaking', 'Listening', 'Reading'],
     array['small insect', 'insect bite', 'harmful insect'],
     array['bug'],
     array[]::text[],
     array['insects'],
     'Insect bite là vết côn trùng cắn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bee', 'con ong', 'a flying insect that makes honey', 'noun', '/biː/',
     'Bees make honey from flowers.', 'Ong làm mật từ hoa.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['honey bee', 'busy bee', 'bee hive'],
     array[]::text[],
     array[]::text[],
     array['beehive'],
     'As busy as a bee là thành ngữ: rất bận rộn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'butterfly', 'con bướm', 'an insect with large coloured wings', 'noun', '/ˈbʌtərflaɪ/',
     'A butterfly is on the flower.', 'Một con bướm đậu trên bông hoa.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Nature).',
     array['Speaking', 'Listening'],
     array['colourful butterfly', 'butterfly wings', 'catch a butterfly'],
     array[]::text[],
     array[]::text[],
     array['butterflies'],
     'Butterflies in my stomach là cảm giác hồi hộp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wild', 'hoang dã', 'living in nature, not with people', 'adjective', '/waɪld/',
     'Tigers are wild animals.', 'Hổ là động vật hoang dã.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['wild animals', 'wild life', 'go wild'],
     array['natural'],
     array['tame', 'domestic'],
     array['wildlife', 'wilderness', 'wildly'],
     'Wildlife là động vật hoang dã nói chung.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'zoo', 'sở thú', 'a place where people can see animals', 'noun', '/zuː/',
     'We visit the zoo on Sundays.', 'Chúng tôi đi sở thú vào Chủ nhật.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['visit the zoo', 'go to the zoo', 'zoo animals'],
     array[]::text[],
     array[]::text[],
     array['zookeeper'],
     'Zoo là dạng viết ngắn của zoological garden.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'farm', 'nông trại', 'a place where people grow food or keep animals', 'noun', '/fɑːrm/',
     'My uncle works on a farm.', 'Chú tôi làm việc ở một nông trại.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['work on a farm', 'farm animals', 'farm land'],
     array[]::text[],
     array[]::text[],
     array['farmer', 'farming'],
     'Cũng là động từ: farm rice.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'feed', 'cho ăn', 'to give food to a person or animal', 'verb', '/fiːd/',
     'I feed my dog twice a day.', 'Tôi cho chó ăn hai lần mỗi ngày.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening', 'Writing'],
     array['feed the animals', 'feed a dog', 'feed a family'],
     array['nourish'],
     array['starve'],
     array['fed', 'feeding', 'food'],
     'Quá khứ là fed.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tail', 'cái đuôi', 'the long part at the back of an animal', 'noun', '/teɪl/',
     'The dog moves its tail when it is happy.', 'Con chó vẫy đuôi khi nó vui.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 (Animals).',
     array['Speaking', 'Listening'],
     array['long tail', 'wag its tail', 'tail feather'],
     array[]::text[],
     array[]::text[],
     array['tails'],
     'Wag its tail là vẫy đuôi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wing', 'cái cánh', 'the part of a bird or insect used for flying', 'noun', '/wɪŋ/',
     'The bird has large wings.', 'Con chim có đôi cánh lớn.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['bird wing', 'butterfly wings', 'spread its wings'],
     array[]::text[],
     array[]::text[],
     array['wings'],
     'Thường dùng ở số nhiều: wings.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fur', 'bộ lông thú', 'the thick soft hair of an animal', 'noun', '/fɜːr/',
     'The bear has thick fur.', 'Con gấu có bộ lông dày.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['thick fur', 'soft fur', 'fur coat'],
     array['hair'],
     array[]::text[],
     array['furry'],
     'Furry là tính từ: có nhiều lông.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'feather', 'lông chim', 'a light thing that covers a bird', 'noun', '/ˈfeðər/',
     'The bird has colourful feathers.', 'Con chim có bộ lông sặc sỡ.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['bird feather', 'soft feather', 'colourful feathers'],
     array[]::text[],
     array[]::text[],
     array['feathery'],
     'Feather phát âm /ˈfeðər/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bite', 'cắn', 'to cut something with your teeth', 'verb', '/baɪt/',
     'Some snakes can bite people.', 'Một số loài rắn có thể cắn người.',
     1.0, 'Animals', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['bite someone', 'snake bite', 'insect bite'],
     array['nibble'],
     array[]::text[],
     array['bit', 'bitten', 'biter'],
     'Quá khứ là bit, quá khứ phân từ là bitten.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cage', 'cái lồng', 'a box with bars for keeping animals', 'noun', '/keɪdʒ/',
     'The bird is in a small cage.', 'Con chim ở trong một cái lồng nhỏ.',
     1.0, 'Animals', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['bird cage', 'in a cage', 'keep animals in cages'],
     array[]::text[],
     array[]::text[],
     array['caged'],
     'Keep animals in cages là chủ đề tranh luận quen thuộc.')
  on conflict do nothing;

end $$;
