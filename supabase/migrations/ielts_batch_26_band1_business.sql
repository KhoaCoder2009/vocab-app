-- BATCH 26 | BAND 1.0 | TOPIC: Business | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A2
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Business' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Business',
       'Từ vựng IELTS chủ đề Business cho Band 1: mua bán, sản phẩm, lợi nhuận và kinh doanh nhỏ.',
       'easy', true, 'teal')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Business' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'business', 'kinh doanh, doanh nghiệp', 'the buying and selling of goods or services', 'noun', '/ˈbɪznəs/',
     'My parents run a small business.', 'Bố mẹ tôi điều hành một doanh nghiệp nhỏ.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['run a business', 'small business', 'start a business'],
     array['company', 'trade'],
     array[]::text[],
     array['businessman', 'businesslike'],
     'Không đếm được khi nói kinh doanh nói chung.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sell', 'bán', 'to give something to someone for money', 'verb', '/sel/',
     'We sell fruit and vegetables.', 'Chúng tôi bán trái cây và rau củ.',
     1.0, 'Business', 'A2', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening', 'Writing'],
     array['sell goods', 'sell online', 'sell at a low price'],
     array['trade'],
     array['buy'],
     array['sold', 'seller', 'selling'],
     'Quá khứ là sold.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'buy', 'mua', 'to get something by paying money', 'verb', '/baɪ/',
     'I buy fresh fruit at the market.', 'Tôi mua trái cây tươi ở chợ.',
     1.0, 'Business', 'A2', 'Speaking Part 1 (Shopping).',
     array['Speaking', 'Listening', 'Writing'],
     array['buy a house', 'buy online', 'buy in bulk'],
     array['purchase'],
     array['sell'],
     array['bought', 'buyer'],
     'Quá khứ là bought.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'product', 'sản phẩm', 'something that is made or grown to be sold', 'noun', '/ˈprɑːdʌkt/',
     'This shop sells local products.', 'Cửa hàng này bán sản phẩm địa phương.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['local product', 'new product', 'product quality'],
     array['item', 'goods'],
     array[]::text[],
     array['produce', 'production', 'productive'],
     'Product là danh từ, produce là động từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'goods', 'hàng hoá', 'things that are made to be sold', 'noun', '/ɡʊdz/',
     'The shop has many goods from abroad.', 'Cửa hàng có nhiều hàng hoá từ nước ngoài.',
     1.0, 'Business', 'A2', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['sell goods', 'imported goods', 'consumer goods'],
     array['merchandise'],
     array[]::text[],
     array['good'],
     'Goods luôn ở số nhiều khi nói hàng hoá.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'brand', 'thương hiệu', 'a name of a product made by a company', 'noun', '/brænd/',
     'This is a famous brand of shoes.', 'Đây là một thương hiệu giày nổi tiếng.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['famous brand', 'local brand', 'brand name'],
     array['make', 'label'],
     array[]::text[],
     array['branding', 'branded'],
     'Brand name là tên thương hiệu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'profit', 'lợi nhuận', 'money you gain after paying all costs', 'noun', '/ˈprɑːfɪt/',
     'The company makes a big profit every year.', 'Công ty thu được lợi nhuận lớn mỗi năm.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['make a profit', 'profit and loss', 'high profit'],
     array['gain', 'earnings'],
     array['loss'],
     array['profitable', 'profitably'],
     'Make a profit là kiếm lời.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'loss', 'khoản lỗ', 'money that you lose', 'noun', '/lɔːs/',
     'The shop has a big loss this year.', 'Cửa hàng bị lỗ lớn trong năm nay.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['make a loss', 'heavy loss', 'loss of money'],
     array['deficit'],
     array['profit'],
     array['lose', 'lost'],
     'Loss là danh từ, lose là động từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'price', 'giá cả', 'the amount of money you pay for something', 'noun', '/praɪs/',
     'The price of rice is going up.', 'Giá gạo đang tăng.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['high price', 'low price', 'price of'],
     array['cost', 'charge'],
     array[]::text[],
     array['priceless', 'pricey'],
     'Price rise là sự tăng giá.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cost', 'chi phí, tốn', 'the amount of money needed to buy or do something', 'noun', '/kɔːst/',
     'The cost of living is high in the city.', 'Chi phí sinh hoạt ở thành phố cao.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['cost of living', 'low cost', 'at a cost'],
     array['price', 'expense'],
     array[]::text[],
     array['costly', 'costing'],
     'Cũng là động từ: It costs ten dollars.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'agreement', 'thoả thuận', 'a decision that two sides accept', 'noun', '/əˈɡriːmənt/',
     'The two companies sign an agreement.', 'Hai công ty ký một thoả thuận.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['sign an agreement', 'reach an agreement', 'in agreement'],
     array['deal', 'contract'],
     array['disagreement'],
     array['agree', 'agreeable', 'disagree'],
     'In agreement with là đồng ý với.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'manufacture', 'sản xuất', 'to make goods in a factory', 'verb', '/ˌmænjuˈfæktʃər/',
     'The company manufactures mobile phones.', 'Công ty sản xuất điện thoại di động.',
     1.0, 'Business', 'A2', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['manufacture goods', 'manufacture cars', 'manufacture products'],
     array['produce', 'make'],
     array[]::text[],
     array['manufacturer', 'manufacturing'],
     'Manufacturer là nhà sản xuất.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'offer', 'đề nghị, ưu đãi', 'to give someone the chance to have something', 'verb', '/ˈɔːfər/',
     'The shop offers free delivery.', 'Cửa hàng cung cấp giao hàng miễn phí.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['offer a job', 'special offer', 'offer help'],
     array['provide', 'give'],
     array['refuse'],
     array['offered', 'offering'],
     'Cũng là danh từ: a special offer.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'deal', 'thoả thuận, giao dịch', 'an agreement in business', 'noun', '/diːl/',
     'We make a good deal with our supplier.', 'Chúng tôi có một thoả thuận tốt với nhà cung cấp.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['make a deal', 'good deal', 'deal with'],
     array['agreement'],
     array[]::text[],
     array['dealer', 'dealing'],
     'Deal with là xử lý, giải quyết.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'client', 'khách hàng, thân chủ', 'a person who pays for professional service', 'noun', '/ˈklaɪənt/',
     'The lawyer meets a client this afternoon.', 'Luật sư gặp một thân chủ chiều nay.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['meet a client', 'new client', 'regular client'],
     array['customer'],
     array[]::text[],
     array['clientele'],
     'Client dùng cho dịch vụ chuyên môn, customer cho bán hàng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'supplier', 'nhà cung cấp', 'a company that provides goods', 'noun', '/səˈplaɪər/',
     'We buy vegetables from a local supplier.', 'Chúng tôi mua rau từ một nhà cung cấp địa phương.',
     1.0, 'Business', 'A2', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['local supplier', 'main supplier', 'change supplier'],
     array['provider'],
     array[]::text[],
     array['supply', 'supplies'],
     'Supplier gắn với supply.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'employer', 'người sử dụng lao động', 'a person or company that gives people jobs', 'noun', '/ɪmˈplɔɪər/',
     'The employer pays workers on time.', 'Người sử dụng lao động trả lương đúng hạn.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['good employer', 'big employer', 'local employer'],
     array['boss'],
     array['employee'],
     array['employ', 'employee', 'employment'],
     'Employer đối lập với employee.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'risk', 'rủi ro', 'the chance that something bad will happen', 'noun', '/rɪsk/',
     'Starting a business is a risk.', 'Khởi nghiệp là một rủi ro.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['take a risk', 'high risk', 'risk of'],
     array['danger', 'threat'],
     array['safety'],
     array['risky', 'riskily'],
     'Take a risk là chấp nhận rủi ro.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'stock', 'hàng tồn kho', 'goods that a shop keeps to sell', 'noun', '/stɑːk/',
     'The shop has no stock of this phone.', 'Cửa hàng hết hàng điện thoại này.',
     1.0, 'Business', 'A2', 'Listening Section 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['in stock', 'out of stock', 'stock market'],
     array['supply'],
     array[]::text[],
     array['stockroom', 'stockpile'],
     'Out of stock là hết hàng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'expand', 'mở rộng', 'to become bigger', 'verb', '/ɪkˈspænd/',
     'The company wants to expand overseas.', 'Công ty muốn mở rộng ra nước ngoài.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['expand a business', 'expand overseas', 'expand quickly'],
     array['grow', 'enlarge'],
     array['shrink'],
     array['expansion', 'expanded'],
     'Expand into a market là mở rộng vào thị trường.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'trade', 'thương mại, buôn bán', 'the buying and selling of goods', 'noun', '/treɪd/',
     'Trade between countries is important.', 'Thương mại giữa các nước rất quan trọng.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['international trade', 'free trade', 'trade with'],
     array['commerce'],
     array[]::text[],
     array['trader', 'trading'],
     'Cũng là động từ: trade goods.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'export', 'xuất khẩu', 'to send goods to another country to sell', 'verb', '/ɪkˈspɔːrt/',
     'Vietnam exports rice to many countries.', 'Việt Nam xuất khẩu gạo sang nhiều nước.',
     1.0, 'Business', 'A2', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['export goods', 'export rice', 'main export'],
     array['sell abroad'],
     array['import'],
     array['exporter', 'exports'],
     'Nhấn âm: động từ exPORT, danh từ EXport.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'import', 'nhập khẩu', 'to bring goods into a country to sell', 'verb', '/ɪmˈpɔːrt/',
     'The country imports oil from abroad.', 'Đất nước nhập khẩu dầu từ nước ngoài.',
     1.0, 'Business', 'A2', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['import goods', 'import oil', 'imported goods'],
     array['bring in'],
     array['export'],
     array['importer', 'imports', 'imported'],
     'Import trái nghĩa với export.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'owner', 'chủ sở hữu', 'a person who has something', 'noun', '/ˈoʊnər/',
     'The shop owner is very kind.', 'Chủ cửa hàng rất tốt bụng.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['shop owner', 'business owner', 'house owner'],
     array['proprietor'],
     array[]::text[],
     array['own', 'ownership'],
     'Own là động từ: sở hữu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'partner', 'đối tác', 'a person who does business with you', 'noun', '/ˈpɑːrtnər/',
     'I start a business with my partner.', 'Tôi khởi nghiệp cùng đối tác của mình.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['business partner', 'work with a partner', 'partner company'],
     array['associate'],
     array[]::text[],
     array['partnership'],
     'Partner còn là bạn đời.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'contract', 'hợp đồng', 'an official written agreement', 'noun', '/ˈkɑːntrækt/',
     'I sign a contract with the company.', 'Tôi ký hợp đồng với công ty.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['sign a contract', 'work contract', 'long-term contract'],
     array['agreement'],
     array[]::text[],
     array['contractor', 'contractual'],
     'Contract còn là động từ /kənˈtrækt/: co lại.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'competition', 'sự cạnh tranh, cuộc thi', 'a situation where people try to win', 'noun', '/ˌkɑːmpəˈtɪʃn/',
     'There is strong competition between shops.', 'Có sự cạnh tranh mạnh giữa các cửa hàng.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['strong competition', 'enter a competition', 'win a competition'],
     array['rivalry', 'contest'],
     array[]::text[],
     array['compete', 'competitor', 'competitive'],
     'Compete là động từ tương ứng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'success', 'thành công', 'the achievement of your aims', 'noun', '/səkˈses/',
     'Hard work leads to success.', 'Làm việc chăm chỉ dẫn đến thành công.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['achieve success', 'great success', 'key to success'],
     array['achievement'],
     array['failure'],
     array['succeed', 'successful', 'successfully'],
     'Key to success là cụm hay dùng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'growth', 'sự tăng trưởng', 'the process of becoming bigger', 'noun', '/ɡroʊθ/',
     'The company shows fast growth.', 'Công ty cho thấy sự tăng trưởng nhanh.',
     1.0, 'Business', 'A2', 'Speaking Part 3 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['economic growth', 'rapid growth', 'growth rate'],
     array['expansion', 'increase'],
     array['decline'],
     array['grow', 'grown'],
     'Growth không đếm được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'startup', 'công ty khởi nghiệp', 'a new small company', 'noun', '/ˈstɑːrtʌp/',
     'My friend works for a tech startup.', 'Bạn tôi làm việc cho một công ty khởi nghiệp công nghệ.',
     1.0, 'Business', 'A2', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['tech startup', 'start a startup', 'startup company'],
     array['new business'],
     array[]::text[],
     array['start', 'up'],
     'Startup thường ở lĩnh vực công nghệ.')
  on conflict do nothing;

end $$;
