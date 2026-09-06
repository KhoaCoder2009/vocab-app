-- =========================================================
-- 50 CHỦ ĐỀ IELTS BỔ SUNG CHO BAND 4.0-6.0
-- Các chủ đề phổ biến trong IELTS Speaking và Writing  
-- Có thể chạy nhiều lần không bị trùng
-- =========================================================

-- 1. IELTS Work & Jobs
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Work & Jobs', 'Từ vựng về công việc - IELTS Speaking Part 1 & 2, Band 4.0-6.0.', 'medium', true, 'blue'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Work & Jobs')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('occupation', 'nghề nghiệp', 'noun', '/ˌɒkjuˈpeɪʃn/', 'What is your occupation?', 'Nghề nghiệp của bạn là gì?'),
    ('salary', 'lương', 'noun', '/ˈsæləri/', 'She earns a good salary.', 'Cô ấy có mức lương tốt.'),
    ('promotion', 'thăng chức', 'noun', '/prəˈməʊʃn/', 'He got a promotion last year.', 'Anh ấy được thăng chức năm ngoái.'),
    ('colleague', 'đồng nghiệp', 'noun', '/ˈkɒliːɡ/', 'My colleagues are very helpful.', 'Đồng nghiệp của tôi rất nhiệt tình.'),
    ('retire', 'nghỉ hưu', 'verb', '/rɪˈtaɪə(r)/', 'He will retire at 65.', 'Anh ấy sẽ nghỉ hưu ở tuổi 65.'),
    ('overtime', 'làm thêm giờ', 'noun', '/ˈəʊvətaɪm/', 'I worked overtime yesterday.', 'Hôm qua tôi làm thêm giờ.'),
    ('unemployed', 'thất nghiệp', 'adjective', '/ˌʌnɪmˈplɔɪd/', 'Many young people are unemployed.', 'Nhiều người trẻ đang thất nghiệp.'),
    ('interview', 'phỏng vấn', 'noun', '/ˈɪntəvjuː/', 'I have a job interview tomorrow.', 'Ngày mai tôi có buổi phỏng vấn xin việc.'),
    ('experience', 'kinh nghiệm', 'noun', '/ɪkˈspɪəriəns/', 'Do you have work experience?', 'Bạn có kinh nghiệm làm việc không?'),
    ('qualified', 'có trình độ', 'adjective', '/ˈkwɒlɪfaɪd/', 'She is well qualified for the job.', 'Cô ấy có trình độ tốt cho công việc này.'),
    ('full-time', 'toàn thời gian', 'adjective', '/fʊl taɪm/', 'I have a full-time job.', 'Tôi có một công việc toàn thời gian.'),
    ('part-time', 'bán thời gian', 'adjective', '/pɑːt taɪm/', 'She works part-time at a cafe.', 'Cô ấy làm bán thời gian ở quán cà phê.'),
    ('shift', 'ca làm việc', 'noun', '/ʃɪft/', 'I work night shifts.', 'Tôi làm ca đêm.'),
    ('demanding', 'đòi hỏi cao', 'adjective', '/dɪˈmɑːndɪŋ/', 'It is a demanding job.', 'Đây là công việc đòi hỏi cao.'),
    ('rewarding', 'bõ công', 'adjective', '/rɪˈwɔːdɪŋ/', 'Teaching is very rewarding.', 'Giảng dạy rất bõ công.'),
    ('flexible', 'linh hoạt', 'adjective', '/ˈfleksəbl/', 'The company offers flexible hours.', 'Công ty cung cấp giờ làm việc linh hoạt.'),
    ('recruit', 'tuyển dụng', 'verb', '/rɪˈkruːt/', 'They are recruiting new staff.', 'Họ đang tuyển nhân viên mới.'),
    ('resign', 'từ chức', 'verb', '/rɪˈzaɪn/', 'He resigned from his job.', 'Anh ấy đã từ chức.'),
    ('apprentice', 'người học nghề', 'noun', '/əˈprentɪs/', 'He started as an apprentice.', 'Anh ấy bắt đầu là người học nghề.'),
    ('profession', 'nghề nghiệp', 'noun', '/prəˈfeʃn/', 'Medicine is a respected profession.', 'Y khoa là một nghề nghiệp được tôn trọng.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 2. IELTS Family
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Family', 'Từ vựng về gia đình - IELTS Speaking Part 1 & 2, Band 4.0-6.0.', 'easy', true, 'pink'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Family')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('relative', 'họ hàng', 'noun', '/ˈrelətɪv/', 'I have many relatives.', 'Tôi có nhiều họ hàng.'),
    ('sibling', 'anh chị em ruột', 'noun', '/ˈsɪblɪŋ/', 'I have two siblings.', 'Tôi có hai anh chị em ruột.'),
    ('nuclear family', 'gia đình hạt nhân', 'noun', '/ˌnjuːkliə ˈfæməli/', 'I live in a nuclear family.', 'Tôi sống trong một gia đình hạt nhân.'),
    ('extended family', 'đại gia đình', 'noun', '/ɪkˌstendɪd ˈfæməli/', 'My extended family is very large.', 'Đại gia đình tôi rất lớn.'),
    ('close-knit', 'gắn bó', 'adjective', '/kləʊs nɪt/', 'We are a close-knit family.', 'Chúng tôi là gia đình gắn bó.'),
    ('ancestor', 'tổ tiên', 'noun', '/ˈænsestə(r)/', 'My ancestors lived here.', 'Tổ tiên tôi sống ở đây.'),
    ('descendant', 'hậu duệ', 'noun', '/dɪˈsendənt/', 'He is a descendant of farmers.', 'Anh ấy là hậu duệ của nông dân.'),
    ('bond', 'mối quan hệ', 'noun', '/bɒnd/', 'We have a strong bond.', 'Chúng tôi có mối quan hệ mạnh mẽ.'),
    ('reunion', 'đoàn tụ', 'noun', '/ˌriːˈjuːniən/', 'We had a family reunion.', 'Chúng tôi có buổi đoàn tụ gia đình.'),
    ('upbringing', 'sự nuôi dạy', 'noun', '/ˈʌpbrɪŋɪŋ/', 'He had a good upbringing.', 'Anh ấy có một nền giáo dục tốt.'),
    ('adopt', 'nhận nuôi', 'verb', '/əˈdɒpt/', 'They adopted a child.', 'Họ đã nhận nuôi một đứa trẻ.'),
    ('generation gap', 'khoảng cách thế hệ', 'noun', '/ˌdʒenəˈreɪʃn ɡæp/', 'There is a generation gap.', 'Có một khoảng cách thế hệ.'),
    ('affectionate', 'trìu mến', 'adjective', '/əˈfekʃənət/', 'She is very affectionate.', 'Cô ấy rất trìu mến.'),
    ('supportive', 'ủng hộ', 'adjective', '/səˈpɔːtɪv/', 'My family is very supportive.', 'Gia đình tôi rất ủng hộ.'),
    ('household', 'hộ gia đình', 'noun', '/ˈhaʊshəʊld/', 'Our household has five members.', 'Hộ gia đình chúng tôi có năm người.'),
    ('breadwinner', 'trụ cột gia đình', 'noun', '/ˈbredwɪnə(r)/', 'My father is the breadwinner.', 'Bố tôi là trụ cột gia đình.'),
    ('only child', 'con một', 'noun', '/ˈəʊnli tʃaɪld/', 'I am an only child.', 'Tôi là con một.'),
    ('twins', 'sinh đôi', 'noun', '/twɪnz/', 'They are twins.', 'Họ là sinh đôi.'),
    ('raise', 'nuôi dạy', 'verb', '/reɪz/', 'She raised three children.', 'Bà ấy đã nuôi dạy ba đứa con.'),
    ('inherit', 'thừa kế', 'verb', '/ɪnˈherɪt/', 'He inherited the house.', 'Anh ấy thừa kế ngôi nhà.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 3. IELTS Hobbies
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Hobbies', 'Từ vựng về sở thích - IELTS Speaking Part 1, Band 4.0-6.0.', 'easy', true, 'orange'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Hobbies')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('hobby', 'sở thích', 'noun', '/ˈhɒbi/', 'Reading is my favorite hobby.', 'Đọc sách là sở thích yêu thích của tôi.'),
    ('leisure time', 'thời gian rảnh rỗi', 'noun', '/ˈleʒə(r) taɪm/', 'I watch TV in my leisure time.', 'Tôi xem TV vào thời gian rảnh rỗi.'),
    ('pastime', 'trò tiêu khiển', 'noun', '/ˈpɑːstaɪm/', 'Gardening is a popular pastime.', 'Làm vườn là trò tiêu khiển phổ biến.'),
    ('enthusiastic', 'nhiệt tình', 'adjective', '/ɪnˌθjuːziˈæstɪk/', 'I am enthusiastic about sports.', 'Tôi nhiệt tình về thể thao.'),
    ('keen on', 'đam mê', 'phrase', '/kiːn ɒn/', 'I am keen on photography.', 'Tôi đam mê nhiếp ảnh.'),
    ('collect', 'sưu tập', 'verb', '/kəˈlekt/', 'I collect stamps.', 'Tôi sưu tập tem.'),
    ('painting', 'hội họa', 'noun', '/ˈpeɪntɪŋ/', 'She enjoys painting.', 'Cô ấy thích hội họa.'),
    ('drawing', 'vẽ', 'noun', '/ˈdrɔːɪŋ/', 'He is good at drawing.', 'Anh ấy giỏi vẽ.'),
    ('photography', 'nhiếp ảnh', 'noun', '/fəˈtɒɡrəfi/', 'Photography is my passion.', 'Nhiếp ảnh là đam mê của tôi.'),
    ('gardening', 'làm vườn', 'noun', '/ˈɡɑːdnɪŋ/', 'My mother loves gardening.', 'Mẹ tôi thích làm vườn.'),
    ('knitting', 'đan len', 'noun', '/ˈnɪtɪŋ/', 'Knitting is a relaxing hobby.', 'Đan len là sở thích thư giãn.'),
    ('fishing', 'câu cá', 'noun', '/ˈfɪʃɪŋ/', 'My father goes fishing every weekend.', 'Bố tôi đi câu cá mỗi cuối tuần.'),
    ('hiking', 'đi bộ đường dài', 'noun', '/ˈhaɪkɪŋ/', 'We love hiking in the mountains.', 'Chúng tôi thích đi bộ đường dài trên núi.'),
    ('cycling', 'đạp xe', 'noun', '/ˈsaɪklɪŋ/', 'Cycling is good exercise.', 'Đạp xe là bài tập tốt.'),
    ('jogging', 'chạy bộ', 'noun', '/ˈdʒɒɡɪŋ/', 'I go jogging every morning.', 'Tôi đi chạy bộ mỗi sáng.'),
    ('swimming', 'bơi lội', 'noun', '/ˈswɪmɪŋ/', 'Swimming is my favorite sport.', 'Bơi lội là môn thể thao yêu thích của tôi.'),
    ('chess', 'cờ vua', 'noun', '/tʃes/', 'He plays chess very well.', 'Anh ấy chơi cờ vua rất giỏi.'),
    ('reading', 'đọc sách', 'noun', '/ˈriːdɪŋ/', 'Reading broadens my mind.', 'Đọc sách mở rộng tầm nhìn của tôi.'),
    ('entertaining', 'giải trí', 'adjective', '/ˌentəˈteɪnɪŋ/', 'Watching movies is entertaining.', 'Xem phim rất giải trí.'),
    ('relaxing', 'thư giãn', 'adjective', '/rɪˈlæksɪŋ/', 'Listening to music is relaxing.', 'Nghe nhạc rất thư giãn.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 4. IELTS Shopping
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Shopping', 'Từ vựng về mua sắm - IELTS Speaking Part 1 & 3, Band 4.0-6.0.', 'easy', true, 'purple'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Shopping')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('bargain', 'món hời', 'noun', '/ˈbɑːɡən/', 'I got a bargain at the sale.', 'Tôi mua được món hời trong đợt giảm giá.'),
    ('discount', 'giảm giá', 'noun', '/ˈdɪskaʊnt/', 'There is a 20% discount.', 'Có giảm giá 20%.'),
    ('receipt', 'hóa đơn', 'noun', '/rɪˈsiːt/', 'Keep your receipt.', 'Giữ hóa đơn của bạn.'),
    ('refund', 'hoàn tiền', 'noun', '/ˈriːfʌnd/', 'Can I get a refund?', 'Tôi có thể được hoàn tiền không?'),
    ('exchange', 'đổi hàng', 'verb', '/ɪksˈtʃeɪndʒ/', 'I want to exchange this shirt.', 'Tôi muốn đổi chiếc áo này.'),
    ('try on', 'thử (quần áo)', 'phrasal verb', '/traɪ ɒn/', 'Can I try this on?', 'Tôi có thể thử cái này không?'),
    ('cashier', 'thu ngân', 'noun', '/kæˈʃɪə(r)/', 'Pay at the cashier.', 'Thanh toán tại quầy thu ngân.'),
    ('queue', 'xếp hàng', 'noun/verb', '/kjuː/', 'There is a long queue.', 'Có một hàng dài người xếp hàng.'),
    ('trolley', 'xe đẩy', 'noun', '/ˈtrɒli/', 'Get a trolley at the entrance.', 'Lấy xe đẩy ở lối vào.'),
    ('aisle', 'lối đi (trong siêu thị)', 'noun', '/aɪl/', 'The bread is in aisle 3.', 'Bánh mì ở lối đi số 3.'),
    ('checkout', 'quầy thanh toán', 'noun', '/ˈtʃekaʊt/', 'Go to the checkout.', 'Đến quầy thanh toán.'),
    ('expensive', 'đắt', 'adjective', '/ɪkˈspensɪv/', 'This watch is very expensive.', 'Chiếc đồng hồ này rất đắt.'),
    ('cheap', 'rẻ', 'adjective', '/tʃiːp/', 'I bought a cheap bag.', 'Tôi mua một cái túi rẻ.'),
    ('reasonable', 'hợp lý (giá)', 'adjective', '/ˈriːznəbl/', 'The price is reasonable.', 'Giá cả hợp lý.'),
    ('overpriced', 'quá đắt', 'adjective', '/ˌəʊvəˈpraɪst/', 'I think it is overpriced.', 'Tôi nghĩ nó quá đắt.'),
    ('brand', 'thương hiệu', 'noun', '/brænd/', 'What brand do you prefer?', 'Bạn thích thương hiệu nào?'),
    ('quality', 'chất lượng', 'noun', '/ˈkwɒləti/', 'The quality is excellent.', 'Chất lượng xuất sắc.'),
    ('window shopping', 'đi ngắm đồ (không mua)', 'noun', '/ˈwɪndəʊ ʃɒpɪŋ/', 'I enjoy window shopping.', 'Tôi thích đi ngắm đồ.'),
    ('browse', 'xem lướt qua', 'verb', '/braʊz/', 'I am just browsing.', 'Tôi chỉ đang xem qua thôi.'),
    ('impulse buying', 'mua hàng bốc đồng', 'noun', '/ˈɪmpʌls ˈbaɪɪŋ/', 'Avoid impulse buying.', 'Tránh mua hàng bốc đồng.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 5. IELTS Transport
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Transport', 'Từ vựng về giao thông vận tải - IELTS Speaking & Writing, Band 4.0-6.0.', 'medium', true, 'red'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Transport')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('traffic jam', 'kẹt xe', 'noun', '/ˈtræfɪk dʒæm/', 'There is a traffic jam.', 'Có ùn tắc giao thông.'),
    ('rush hour', 'giờ cao điểm', 'noun', '/rʌʃ ˈaʊə(r)/', 'Avoid driving in rush hour.', 'Tránh lái xe giờ cao điểm.'),
    ('pedestrian', 'người đi bộ', 'noun', '/pəˈdestriən/', 'Pedestrians must use the crossing.', 'Người đi bộ phải dùng vạch qua đường.'),
    ('crossroads', 'ngã tư', 'noun', '/ˈkrɒsrəʊdz/', 'Turn left at the crossroads.', 'Rẽ trái ở ngã tư.'),
    ('roundabout', 'vòng xoay', 'noun', '/ˈraʊndəbaʊt/', 'Go straight at the roundabout.', 'Đi thẳng qua vòng xoay.'),
    ('fare', 'giá vé', 'noun', '/feə(r)/', 'How much is the fare?', 'Giá vé bao nhiêu?'),
    ('public transport', 'phương tiện công cộng', 'noun', '/ˈpʌblɪk ˈtrænspɔːt/', 'I use public transport.', 'Tôi dùng phương tiện công cộng.'),
    ('overcrowded', 'quá đông', 'adjective', '/ˌəʊvəˈkraʊdɪd/', 'The bus was overcrowded.', 'Xe buýt quá đông.'),
    ('congestion', 'ùn tắc', 'noun', '/kənˈdʒestʃən/', 'Traffic congestion is a problem.', 'Ùn tắc giao thông là vấn đề.'),
    ('speed limit', 'giới hạn tốc độ', 'noun', '/spiːd ˈlɪmɪt/', 'Obey the speed limit.', 'Tuân thủ giới hạn tốc độ.'),
    ('lane', 'làn đường', 'noun', '/leɪn/', 'Stay in your lane.', 'Giữ làn đường của bạn.'),
    ('overtake', 'vượt (xe)', 'verb', '/ˌəʊvəˈteɪk/', 'He overtook my car.', 'Anh ấy vượt xe tôi.'),
    ('collision', 'va chạm', 'noun', '/kəˈlɪʒn/', 'There was a collision.', 'Có một vụ va chạm.'),
    ('breakdown', 'hỏng xe', 'noun', '/ˈbreɪkdaʊn/', 'My car had a breakdown.', 'Xe tôi bị hỏng.'),
    ('carriage', 'toa xe', 'noun', '/ˈkærɪdʒ/', 'The train has 10 carriages.', 'Tàu có 10 toa.'),
    ('platform', 'sân ga', 'noun', '/ˈplætfɔːm/', 'The train leaves from platform 5.', 'Tàu khởi hành từ sân ga số 5.'),
    ('timetable', 'thời gian biểu', 'noun', '/ˈtaɪmteɪbl/', 'Check the bus timetable.', 'Kiểm tra thời gian biểu xe buýt.'),
    ('delay', 'trễ', 'noun/verb', '/dɪˈleɪ/', 'The flight was delayed.', 'Chuyến bay bị trễ.'),
    ('vehicle', 'phương tiện', 'noun', '/ˈviːəkl/', 'Park your vehicle here.', 'Đậu phương tiện của bạn ở đây.'),
    ('commuter', 'người đi làm', 'noun', '/kəˈmjuːtə(r)/', 'Many commuters use the train.', 'Nhiều người đi làm dùng tàu.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 6. IELTS Home & Accommodation
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Home & Accommodation', 'Từ vựng về nhà ở - IELTS Speaking Part 1, Band 4.0-6.0.', 'easy', true, 'brown'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Home & Accommodation')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('apartment', 'căn hộ', 'noun', '/əˈpɑːtmənt/', 'I live in an apartment.', 'Tôi sống trong một căn hộ.'),
    ('flat', 'căn hộ (Anh)', 'noun', '/flæt/', 'She rents a small flat.', 'Cô ấy thuê một căn hộ nhỏ.'),
    ('detached house', 'nhà riêng lẻ', 'noun', '/dɪˈtætʃt haʊs/', 'They own a detached house.', 'Họ sở hữu một ngôi nhà riêng lẻ.'),
    ('semi-detached', 'nhà liền kề', 'adjective', '/ˌsemi dɪˈtætʃt/', 'We live in a semi-detached house.', 'Chúng tôi sống trong nhà liền kề.'),
    ('terraced house', 'nhà liên kế', 'noun', '/ˈterəst haʊs/', 'Terraced houses are common here.', 'Nhà liên kế phổ biến ở đây.'),
    ('bungalow', 'nhà một tầng', 'noun', '/ˈbʌŋɡələʊ/', 'My grandparents live in a bungalow.', 'Ông bà tôi sống trong nhà một tầng.'),
    ('landlord', 'chủ nhà', 'noun', '/ˈlændlɔːd/', 'The landlord raised the rent.', 'Chủ nhà tăng tiền thuê.'),
    ('tenant', 'người thuê nhà', 'noun', '/ˈtenənt/', 'I am a tenant.', 'Tôi là người thuê nhà.'),
    ('mortgage', 'khoản vay mua nhà', 'noun', '/ˈmɔːɡɪdʒ/', 'They have a 20-year mortgage.', 'Họ có khoản vay mua nhà 20 năm.'),
    ('spacious', 'rộng rãi', 'adjective', '/ˈspeɪʃəs/', 'The living room is spacious.', 'Phòng khách rộng rãi.'),
    ('cozy', 'ấm cúng', 'adjective', '/ˈkəʊzi/', 'My bedroom is very cozy.', 'Phòng ngủ của tôi rất ấm cúng.'),
    ('furniture', 'đồ nội thất', 'noun', '/ˈfɜːnɪtʃə(r)/', 'We bought new furniture.', 'Chúng tôi mua đồ nội thất mới.'),
    ('decorate', 'trang trí', 'verb', '/ˈdekəreɪt/', 'I want to decorate my room.', 'Tôi muốn trang trí phòng của mình.'),
    ('renovate', 'cải tạo', 'verb', '/ˈrenəveɪt/', 'They renovated their kitchen.', 'Họ cải tạo nhà bếp của họ.'),
    ('attic', 'gác mái', 'noun', '/ˈætɪk/', 'We store boxes in the attic.', 'Chúng tôi cất hộp trong gác mái.'),
    ('basement', 'tầng hầm', 'noun', '/ˈbeɪsmənt/', 'The basement is used for storage.', 'Tầng hầm được dùng để chứa đồ.'),
    ('balcony', 'ban công', 'noun', '/ˈbælkəni/', 'I have plants on my balcony.', 'Tôi có cây trên ban công.'),
    ('utilities', 'tiện ích (điện nước)', 'noun', '/juːˈtɪlətiz/', 'Utilities are included in the rent.', 'Tiện ích được bao gồm trong tiền thuê.'),
    ('neighborhood', 'khu phố', 'noun', '/ˈneɪbəhʊd/', 'I live in a quiet neighborhood.', 'Tôi sống trong khu phố yên tĩnh.'),
    ('suburb', 'ngoại ô', 'noun', '/ˈsʌbɜːb/', 'They moved to the suburbs.', 'Họ chuyển đến ngoại ô.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 7. IELTS Cities & Urban Life
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Cities & Urban Life', 'Từ vựng về thành phố - IELTS Writing Task 2, Band 4.0-6.0.', 'medium', true, 'gray'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Cities & Urban Life')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('urban', 'thành thị', 'adjective', '/ˈɜːbən/', 'Urban areas are crowded.', 'Khu vực thành thị đông đúc.'),
    ('rural', 'nông thôn', 'adjective', '/ˈrʊərəl/', 'I prefer rural life.', 'Tôi thích cuộc sống nông thôn hơn.'),
    ('infrastructure', 'cơ sở hạ tầng', 'noun', '/ˈɪnfrəstrʌktʃə(r)/', 'The city has good infrastructure.', 'Thành phố có cơ sở hạ tầng tốt.'),
    ('skyscraper', 'nhà chọc trời', 'noun', '/ˈskaɪskreɪpə(r)/', 'There are many skyscrapers.', 'Có nhiều nhà chọc trời.'),
    ('metropolitan', 'đô thị lớn', 'adjective', '/ˌmetrəˈpɒlɪtən/', 'Tokyo is a metropolitan city.', 'Tokyo là một thành phố đô thị lớn.'),
    ('density', 'mật độ', 'noun', '/ˈdensəti/', 'Population density is high.', 'Mật độ dân số cao.'),
    ('outskirts', 'vùng ngoại ô', 'noun', '/ˈaʊtskɜːts/', 'They live on the outskirts.', 'Họ sống ở vùng ngoại ô.'),
    ('amenities', 'tiện nghi', 'noun', '/əˈmiːnətiz/', 'The area has good amenities.', 'Khu vực có tiện nghi tốt.'),
    ('hustle and bustle', 'nhộn nhịp', 'phrase', '/ˈhʌsl ənd ˈbʌsl/', 'I enjoy the hustle and bustle.', 'Tôi thích sự nhộn nhịp.'),
    ('cosmopolitan', 'quốc tế', 'adjective', '/ˌkɒzməˈpɒlɪtən/', 'London is a cosmopolitan city.', 'London là thành phố quốc tế.'),
    ('slum', 'khu ổ chuột', 'noun', '/slʌm/', 'Slums need improvement.', 'Khu ổ chuột cần cải thiện.'),
    ('residential area', 'khu dân cư', 'noun', '/ˌrezɪˈdenʃl ˈeəriə/', 'This is a residential area.', 'Đây là khu dân cư.'),
    ('commercial area', 'khu thương mại', 'noun', '/kəˈmɜːʃl ˈeəriə/', 'The commercial area is busy.', 'Khu thương mại nhộn nhịp.'),
    ('downtown', 'trung tâm thành phố', 'noun', '/ˌdaʊnˈtaʊn/', 'I work downtown.', 'Tôi làm việc ở trung tâm thành phố.'),
    ('public spaces', 'không gian công cộng', 'noun', '/ˈpʌblɪk ˈspeɪsɪz/', 'We need more public spaces.', 'Chúng ta cần nhiều không gian công cộng hơn.'),
    ('pedestrian zone', 'khu đi bộ', 'noun', '/pəˈdestriən zəʊn/', 'There is a pedestrian zone.', 'Có một khu đi bộ.'),
    ('green spaces', 'không gian xanh', 'noun', '/ɡriːn ˈspeɪsɪz/', 'Cities need green spaces.', 'Thành phố cần không gian xanh.'),
    ('parking', 'chỗ đậu xe', 'noun', '/ˈpɑːkɪŋ/', 'Parking is expensive.', 'Chỗ đậu xe đắt.'),
    ('crime rate', 'tỷ lệ tội phạm', 'noun', '/kraɪm reɪt/', 'The crime rate is low.', 'Tỷ lệ tội phạm thấp.'),
    ('litter', 'rác vứt bừa bãi', 'noun', '/ˈlɪtə(r)/', 'Please don''t drop litter.', 'Xin đừng vứt rác bừa bãi.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 8. IELTS Internet & Social Media
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Internet & Social Media', 'Từ vựng về Internet và mạng xã hội - IELTS Speaking & Writing, Band 4.0-6.0.', 'medium', true, 'cyan'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Internet & Social Media')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('social network', 'mạng xã hội', 'noun', '/ˈsəʊʃl ˈnetwɜːk/', 'Facebook is a social network.', 'Facebook là một mạng xã hội.'),
    ('post', 'đăng bài', 'verb/noun', '/pəʊst/', 'She posts photos every day.', 'Cô ấy đăng ảnh mỗi ngày.'),
    ('share', 'chia sẻ', 'verb', '/ʃeə(r)/', 'I shared the article.', 'Tôi đã chia sẻ bài viết.'),
    ('like', 'thích', 'verb/noun', '/laɪk/', 'The post got many likes.', 'Bài đăng nhận được nhiều lượt thích.'),
    ('comment', 'bình luận', 'noun/verb', '/ˈkɒment/', 'Read the comments.', 'Đọc các bình luận.'),
    ('follower', 'người theo dõi', 'noun', '/ˈfɒləʊə(r)/', 'She has 10,000 followers.', 'Cô ấy có 10.000 người theo dõi.'),
    ('profile', 'trang cá nhân', 'noun', '/ˈprəʊfaɪl/', 'Update your profile.', 'Cập nhật trang cá nhân của bạn.'),
    ('privacy', 'riêng tư', 'noun', '/ˈprɪvəsi/', 'Privacy is important online.', 'Quyền riêng tư quan trọng trên mạng.'),
    ('cyber bullying', 'bắt nạt trên mạng', 'noun', '/ˈsaɪbə ˈbʊliɪŋ/', 'Cyber bullying is a problem.', 'Bắt nạt trên mạng là vấn đề.'),
    ('addiction', 'nghiện', 'noun', '/əˈdɪkʃn/', 'Internet addiction affects youth.', 'Nghiện internet ảnh hưởng đến giới trẻ.'),
    ('browse', 'duyệt web', 'verb', '/braʊz/', 'I browse the internet daily.', 'Tôi duyệt web hàng ngày.'),
    ('search engine', 'công cụ tìm kiếm', 'noun', '/sɜːtʃ ˈendʒɪn/', 'Google is a search engine.', 'Google là công cụ tìm kiếm.'),
    ('online shopping', 'mua sắm trực tuyến', 'noun', '/ˌɒnlaɪn ˈʃɒpɪŋ/', 'Online shopping is convenient.', 'Mua sắm trực tuyến tiện lợi.'),
    ('e-commerce', 'thương mại điện tử', 'noun', '/ˈiː kɒmɜːs/', 'E-commerce is growing.', 'Thương mại điện tử đang phát triển.'),
    ('blog', 'blog', 'noun', '/blɒɡ/', 'She writes a food blog.', 'Cô ấy viết blog về ẩm thực.'),
    ('website', 'trang web', 'noun', '/ˈwebsaɪt/', 'Visit our website.', 'Truy cập trang web của chúng tôi.'),
    ('username', 'tên đăng nhập', 'noun', '/ˈjuːzəneɪm/', 'Enter your username.', 'Nhập tên đăng nhập của bạn.'),
    ('password', 'mật khẩu', 'noun', '/ˈpɑːswɜːd/', 'Create a strong password.', 'Tạo mật khẩu mạnh.'),
    ('log in', 'đăng nhập', 'phrasal verb', '/lɒɡ ɪn/', 'Log in to your account.', 'Đăng nhập vào tài khoản của bạn.'),
    ('log out', 'đăng xuất', 'phrasal verb', '/lɒɡ aʊt/', 'Don''t forget to log out.', 'Đừng quên đăng xuất.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 9. IELTS Sports & Exercise
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Sports & Exercise', 'Từ vựng về thể thao - IELTS Speaking Part 1 & 3, Band 4.0-6.0.', 'easy', true, 'green'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Sports & Exercise')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('athlete', 'vận động viên', 'noun', '/ˈæθliːt/', 'He is a professional athlete.', 'Anh ấy là vận động viên chuyên nghiệp.'),
    ('coach', 'huấn luyện viên', 'noun', '/kəʊtʃ/', 'Our coach is very strict.', 'Huấn luyện viên của chúng tôi rất nghiêm khắc.'),
    ('tournament', 'giải đấu', 'noun', '/ˈtʊənəmənt/', 'We won the tournament.', 'Chúng tôi thắng giải đấu.'),
    ('champion', 'vô địch', 'noun', '/ˈtʃæmpiən/', 'She is the world champion.', 'Cô ấy là nhà vô địch thế giới.'),
    ('defeat', 'đánh bại', 'verb', '/dɪˈfiːt/', 'They defeated the opponent.', 'Họ đánh bại đối thủ.'),
    ('score', 'ghi điểm', 'verb/noun', '/skɔː(r)/', 'He scored a goal.', 'Anh ấy ghi một bàn thắng.'),
    ('match', 'trận đấu', 'noun', '/mætʃ/', 'The match starts at 3 PM.', 'Trận đấu bắt đầu lúc 3 giờ chiều.'),
    ('opponent', 'đối thủ', 'noun', '/əˈpəʊnənt/', 'Our opponent is strong.', 'Đối thủ của chúng tôi mạnh.'),
    ('referee', 'trọng tài', 'noun', '/ˌrefəˈriː/', 'The referee made a decision.', 'Trọng tài đã đưa ra quyết định.'),
    ('spectator', 'khán giả', 'noun', '/spekˈteɪtə(r)/', 'There were many spectators.', 'Có nhiều khán giả.'),
    ('stadium', 'sân vận động', 'noun', '/ˈsteɪdiəm/', 'The stadium was full.', 'Sân vận động đầy ắp.'),
    ('pitch', 'sân (bóng đá)', 'noun', '/pɪtʃ/', 'The football pitch is wet.', 'Sân bóng đá ướt.'),
    ('court', 'sân (tennis)', 'noun', '/kɔːt/', 'We play on the tennis court.', 'Chúng tôi chơi trên sân tennis.'),
    ('track', 'đường chạy', 'noun', '/træk/', 'She runs on the track.', 'Cô ấy chạy trên đường chạy.'),
    ('fitness', 'thể lực', 'noun', '/ˈfɪtnəs/', 'I go to a fitness center.', 'Tôi đi đến trung tâm thể dục.'),
    ('warm up', 'khởi động', 'phrasal verb', '/wɔːm ʌp/', 'Always warm up before exercise.', 'Luôn khởi động trước khi tập.'),
    ('work out', 'tập luyện', 'phrasal verb', '/wɜːk aʊt/', 'I work out every morning.', 'Tôi tập luyện mỗi sáng.'),
    ('compete', 'thi đấu', 'verb', '/kəmˈpiːt/', 'They compete at international level.', 'Họ thi đấu ở cấp quốc tế.'),
    ('medal', 'huy chương', 'noun', '/ˈmedl/', 'She won a gold medal.', 'Cô ấy giành huy chương vàng.'),
    ('teamwork', 'làm việc nhóm', 'noun', '/ˈtiːmwɜːk/', 'Teamwork is essential.', 'Làm việc nhóm rất cần thiết.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- 10. IELTS Books & Reading
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Books & Reading', 'Từ vựng về sách và đọc - IELTS Speaking Part 1, Band 4.0-6.0.', 'easy', true, 'brown'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Books & Reading')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('novel', 'tiểu thuyết', 'noun', '/ˈnɒvl/', 'I am reading a novel.', 'Tôi đang đọc một cuốn tiểu thuyết.'),
    ('fiction', 'văn học hư cấu', 'noun', '/ˈfɪkʃn/', 'I prefer fiction to non-fiction.', 'Tôi thích văn học hư cấu hơn phi hư cấu.'),
    ('non-fiction', 'phi hư cấu', 'noun', '/ˌnɒn ˈfɪkʃn/', 'Biography is non-fiction.', 'Tiểu sử là phi hư cấu.'),
    ('author', 'tác giả', 'noun', '/ˈɔːθə(r)/', 'Who is your favorite author?', 'Tác giả yêu thích của bạn là ai?'),
    ('chapter', 'chương', 'noun', '/ˈtʃæptə(r)/', 'I read two chapters.', 'Tôi đọc hai chương.'),
    ('plot', 'cốt truyện', 'noun', '/plɒt/', 'The plot is interesting.', 'Cốt truyện thú vị.'),
    ('character', 'nhân vật', 'noun', '/ˈkærəktə(r)/', 'The main character is brave.', 'Nhân vật chính dũng cảm.'),
    ('library', 'thư viện', 'noun', '/ˈlaɪbrəri/', 'I borrow books from the library.', 'Tôi mượn sách từ thư viện.'),
    ('bookworm', 'mọt sách', 'noun', '/ˈbʊkwɜːm/', 'She is a real bookworm.', 'Cô ấy là mọt sách thực thụ.'),
    ('genre', 'thể loại', 'noun', '/ˈʒɒnrə/', 'What genre do you like?', 'Bạn thích thể loại nào?'),
    ('page-turner', 'sách hấp dẫn', 'noun', '/peɪdʒ ˈtɜːnə(r)/', 'This book is a real page-turner.', 'Cuốn sách này thực sự hấp dẫn.'),
    ('bestseller', 'sách bán chạy', 'noun', '/ˌbestˈselə(r)/', 'It is a bestseller.', 'Đó là sách bán chạy.'),
    ('review', 'đánh giá', 'noun', '/rɪˈvjuː/', 'I read book reviews.', 'Tôi đọc đánh giá sách.'),
    ('recommend', 'giới thiệu', 'verb', '/ˌrekəˈmend/', 'Can you recommend a book?', 'Bạn có thể giới thiệu một cuốn sách không?'),
    ('e-book', 'sách điện tử', 'noun', '/ˈiː bʊk/', 'I read e-books on my tablet.', 'Tôi đọc sách điện tử trên máy tính bảng.'),
    ('publish', 'xuất bản', 'verb', '/ˈpʌblɪʃ/', 'The book was published last year.', 'Cuốn sách được xuất bản năm ngoái.'),
    ('hardcover', 'bìa cứng', 'noun', '/ˈhɑːdkʌvə(r)/', 'I prefer hardcover books.', 'Tôi thích sách bìa cứng hơn.'),
    ('paperback', 'bìa mềm', 'noun', '/ˈpeɪpəbæk/', 'Paperbacks are cheaper.', 'Sách bìa mềm rẻ hơn.'),
    ('bookmark', 'đánh dấu trang', 'noun/verb', '/ˈbʊkmɑːk/', 'Use a bookmark to save your place.', 'Dùng bookmark để đánh dấu trang.'),
    ('absorbing', 'hấp dẫn', 'adjective', '/əbˈzɔːbɪŋ/', 'The story is absorbing.', 'Câu chuyện hấp dẫn.')
  ) as v(word, meaning, pos, pron, example, example_vi);

