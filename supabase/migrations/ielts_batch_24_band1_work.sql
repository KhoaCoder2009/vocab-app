-- BATCH 24 | BAND 1.0 | TOPIC: Work | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Work' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Work',
       'Từ vựng IELTS chủ đề Work cho Band 1: nơi làm việc, đồng nghiệp, lương và giờ giấc cơ bản.',
       'easy', true, 'purple')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Work' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'work', 'công việc, làm việc', 'to do a job or activity for pay or a purpose', 'verb', '/wɜːrk/',
     'I work in a small company.', 'Tôi làm việc trong một công ty nhỏ.',
     1.0, 'Work', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening', 'Writing'],
     array['go to work', 'work hard', 'work from home'],
     array['labour'],
     array['rest'],
     array['worker', 'working', 'workplace'],
     'Work vừa là động từ vừa là danh từ không đếm được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'office', 'văn phòng', 'a room or building where people work', 'noun', '/ˈɔːfɪs/',
     'My office is on the fifth floor.', 'Văn phòng của tôi ở tầng năm.',
     1.0, 'Work', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening', 'Writing'],
     array['work in an office', 'office worker', 'post office'],
     array['workplace'],
     array[]::text[],
     array['officer', 'official'],
     'Post office là bưu điện.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'boss', 'sếp', 'a person who is in charge at work', 'noun', '/bɔːs/',
     'My boss is very kind.', 'Sếp của tôi rất tốt bụng.',
     1.0, 'Work', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['my boss', 'a good boss', 'ask the boss'],
     array['manager', 'supervisor'],
     array['employee'],
     array['bossy'],
     'Boss là cách gọi thân mật, manager lịch sự hơn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'colleague', 'đồng nghiệp', 'a person you work with', 'noun', '/ˈkɑːliːɡ/',
     'My colleagues help me a lot.', 'Đồng nghiệp giúp tôi rất nhiều.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['work colleague', 'friendly colleague', 'my colleagues'],
     array['coworker'],
     array[]::text[],
     array['colleagues'],
     'Phát âm /ˈkɑːliːɡ/, chữ ue không đọc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'manager', 'người quản lý', 'a person who controls a team or business', 'noun', '/ˈmænɪdʒər/',
     'The manager talks to the staff every morning.', 'Người quản lý nói chuyện với nhân viên mỗi sáng.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['sales manager', 'project manager', 'hotel manager'],
     array['director'],
     array['employee'],
     array['manage', 'management', 'managerial'],
     'Manage là động từ tương ứng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'employee', 'nhân viên', 'a person who works for a company', 'noun', '/ɪmˈplɔɪiː/',
     'The company has fifty employees.', 'Công ty có năm mươi nhân viên.',
     1.0, 'Work', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['full-time employee', 'company employee', 'good employee'],
     array['worker', 'staff'],
     array['employer'],
     array['employ', 'employer', 'employment'],
     'Employee (người làm thuê) khác employer (người thuê).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'staff', 'nhân viên (tập thể)', 'all the people who work in a place', 'noun', '/stæf/',
     'The hotel staff are very helpful.', 'Nhân viên khách sạn rất hay giúp đỡ.',
     1.0, 'Work', 'A1', 'Listening Section 1 and Speaking Part 1.',
     array['Speaking', 'Listening', 'Writing'],
     array['hotel staff', 'staff member', 'school staff'],
     array['personnel'],
     array[]::text[],
     array['staffing'],
     'Staff là danh từ tập thể, thường đi với động từ số nhiều ở Anh-Anh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'salary', 'lương', 'the money you get for your job each month', 'noun', '/ˈsæləri/',
     'I get a good salary every month.', 'Tôi nhận lương tốt mỗi tháng.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['monthly salary', 'high salary', 'get a salary'],
     array['wage', 'income'],
     array[]::text[],
     array['salaries'],
     'Salary là lương tháng, wage là lương theo giờ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pay', 'trả tiền, lương', 'to give money for work or goods', 'verb', '/peɪ/',
     'The company pays us on the last day of the month.', 'Công ty trả lương cho chúng tôi vào ngày cuối tháng.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['pay for', 'pay a fine', 'good pay'],
     array['reward'],
     array['owe'],
     array['paid', 'payment', 'payer'],
     'Quá khứ là paid.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hour', 'giờ', 'sixty minutes', 'noun', '/ˈaʊər/',
     'I work eight hours a day.', 'Tôi làm việc tám giờ mỗi ngày.',
     1.0, 'Work', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening', 'Writing'],
     array['working hours', 'half an hour', 'in an hour'],
     array[]::text[],
     array[]::text[],
     array['hourly'],
     'Chữ h là âm câm: an hour.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'meeting', 'cuộc họp', 'an event where people come together to talk', 'noun', '/ˈmiːtɪŋ/',
     'We have a meeting every Monday.', 'Chúng tôi có một cuộc họp mỗi thứ Hai.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['have a meeting', 'attend a meeting', 'business meeting'],
     array['conference'],
     array[]::text[],
     array['meet'],
     'Attend a meeting là tham dự cuộc họp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'project', 'dự án', 'a planned piece of work', 'noun', '/ˈprɑːdʒekt/',
     'I work on a new project this month.', 'Tháng này tôi làm một dự án mới.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['work on a project', 'school project', 'new project'],
     array['scheme'],
     array[]::text[],
     array['projector'],
     'Project còn là động từ /prəˈdʒekt/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'company', 'công ty', 'a business that sells things or services', 'noun', '/ˈkʌmpəni/',
     'I work for a large company.', 'Tôi làm việc cho một công ty lớn.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['work for a company', 'private company', 'company car'],
     array['firm'],
     array[]::text[],
     array['companies', 'companion'],
     'Company còn là sự bầu bạn: keep someone company.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'worker', 'người lao động', 'a person who works', 'noun', '/ˈwɜːrkər/',
     'Factory workers start early in the morning.', 'Công nhân nhà máy bắt đầu sớm vào buổi sáng.',
     1.0, 'Work', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['factory worker', 'office worker', 'hard worker'],
     array['employee'],
     array[]::text[],
     array['work', 'working'],
     'Hard worker là người chăm chỉ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'break', 'giờ nghỉ', 'a short time to rest during work', 'noun', '/breɪk/',
     'We take a break at noon.', 'Chúng tôi nghỉ giải lao vào buổi trưa.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['take a break', 'lunch break', 'coffee break'],
     array['rest', 'pause'],
     array[]::text[],
     array['broke', 'broken'],
     'Break còn là động từ: break a glass.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'shift', 'ca làm việc', 'a fixed period of work time', 'noun', '/ʃɪft/',
     'My brother works the night shift.', 'Anh trai tôi làm ca đêm.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['night shift', 'work a shift', 'early shift'],
     array[]::text[],
     array[]::text[],
     array['shifts'],
     'Night shift là ca đêm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'deadline', 'hạn chót', 'the last time you can finish something', 'noun', '/ˈdedlaɪn/',
     'I must finish this report before the deadline.', 'Tôi phải hoàn thành báo cáo này trước hạn chót.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['meet a deadline', 'tight deadline', 'miss a deadline'],
     array['time limit'],
     array[]::text[],
     array['dead', 'line'],
     'Meet a deadline là kịp hạn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'schedule', 'lịch làm việc', 'a plan of when things will happen', 'noun', '/ˈskedʒuːl/',
     'My schedule is very busy this week.', 'Lịch làm việc của tôi tuần này rất bận.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['busy schedule', 'work schedule', 'on schedule'],
     array['timetable'],
     array[]::text[],
     array['scheduled'],
     'On schedule là đúng lịch.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'report', 'báo cáo', 'a document with information about something', 'noun', '/rɪˈpɔːrt/',
     'I write a report every Friday.', 'Tôi viết một bản báo cáo mỗi thứ Sáu.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['write a report', 'annual report', 'news report'],
     array['account'],
     array[]::text[],
     array['reporter', 'reported'],
     'Cũng là động từ: report a problem.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'customer', 'khách hàng', 'a person who buys goods or services', 'noun', '/ˈkʌstəmər/',
     'We always help our customers.', 'Chúng tôi luôn giúp đỡ khách hàng.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['regular customer', 'customer service', 'serve a customer'],
     array['client', 'buyer'],
     array['seller'],
     array['custom', 'customise'],
     'Customer service là dịch vụ khách hàng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'service', 'dịch vụ', 'work done for customers', 'noun', '/ˈsɜːrvɪs/',
     'The hotel has good service.', 'Khách sạn có dịch vụ tốt.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['customer service', 'public service', 'good service'],
     array['help'],
     array[]::text[],
     array['serve', 'server'],
     'Service còn là bữa phục vụ của nhà hàng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'overtime', 'giờ làm thêm', 'extra hours worked after normal hours', 'noun', '/ˈoʊvərtaɪm/',
     'I work overtime before New Year.', 'Tôi làm thêm giờ trước Tết.',
     1.0, 'Work', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['work overtime', 'overtime pay', 'do overtime'],
     array['extra hours'],
     array[]::text[],
     array['over', 'time'],
     'Work overtime là làm thêm giờ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'leader', 'người lãnh đạo', 'a person who is in charge of a group', 'noun', '/ˈliːdər/',
     'A good leader listens to the team.', 'Một người lãnh đạo giỏi biết lắng nghe đội ngũ.',
     1.0, 'Work', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['team leader', 'good leader', 'world leader'],
     array['head'],
     array['follower'],
     array['lead', 'leadership', 'leading'],
     'Team leader là trưởng nhóm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'duty', 'nhiệm vụ', 'something you must do as part of your job', 'noun', '/ˈduːti/',
     'My duty is to help customers.', 'Nhiệm vụ của tôi là giúp khách hàng.',
     1.0, 'Work', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['on duty', 'do your duty', 'duty to'],
     array['responsibility', 'task'],
     array[]::text[],
     array['dutiful', 'duties'],
     'Off duty là hết giờ làm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'responsible', 'có trách nhiệm', 'having a duty to do or take care of something', 'adjective', '/rɪˈspɑːnsəbl/',
     'I am responsible for the project.', 'Tôi chịu trách nhiệm về dự án.',
     1.0, 'Work', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['responsible for', 'responsible person', 'take responsibility'],
     array['accountable'],
     array['irresponsible'],
     array['responsibility', 'responsibly'],
     'Responsible for + danh từ hoặc V-ing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hire', 'thuê, tuyển dụng', 'to give someone a job', 'verb', '/haɪər/',
     'The company hires new staff every year.', 'Công ty tuyển nhân viên mới mỗi năm.',
     1.0, 'Work', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['hire staff', 'hire a worker', 'hire a car'],
     array['recruit', 'employ'],
     array['fire'],
     array['hired', 'hiring', 'hiree'],
     'Hire nhân viên, rent nhà (Anh-Anh).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'full-time', 'toàn thời gian', 'working the whole normal working week', 'adjective', '/ˌfʊl ˈtaɪm/',
     'She has a full-time job in a bank.', 'Cô ấy có công việc toàn thời gian ở ngân hàng.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['full-time job', 'work full-time', 'full-time student'],
     array[]::text[],
     array['part-time'],
     array['full', 'time'],
     'Cũng dùng như trạng từ: work full-time.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'part-time', 'bán thời gian', 'working only some hours of the week', 'adjective', '/ˌpɑːrt ˈtaɪm/',
     'Many students have a part-time job.', 'Nhiều sinh viên có công việc bán thời gian.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['part-time job', 'work part-time', 'part-time worker'],
     array[]::text[],
     array['full-time'],
     array['part', 'time'],
     'Part-time job rất hay xuất hiện trong Speaking.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'attend', 'tham dự', 'to go to an event or a place', 'verb', '/əˈtend/',
     'I attend a meeting every Monday.', 'Tôi tham dự một cuộc họp mỗi thứ Hai.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['attend a meeting', 'attend school', 'attend a class'],
     array['go to', 'take part in'],
     array['miss'],
     array['attendance', 'attendant'],
     'Attend + tân ngữ, không dùng attend to.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'earn', 'kiếm tiền', 'to get money for work', 'verb', '/ɜːrn/',
     'He earns money by working part-time.', 'Anh ấy kiếm tiền bằng cách làm việc bán thời gian.',
     1.0, 'Work', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['earn money', 'earn a living', 'earn a salary'],
     array['make', 'receive'],
     array['spend'],
     array['earnings', 'earner'],
     'Earn a living là kiếm sống.')
  on conflict do nothing;

end $$;
