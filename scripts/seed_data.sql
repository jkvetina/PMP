SET DEFINE OFF

TRUNCATE TABLE tasks;
TRUNCATE TABLE sprints;
TRUNCATE TABLE resource_skills;
TRUNCATE TABLE skills;
TRUNCATE TABLE projects;
TRUNCATE TABLE resources;



--
-- RESOURCES
--
-- SELECT resource_id, person_name, description_, is_active FROM resources;
--
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Mosasaurus', 'Did dinosaurs live in water? Sure! Since they were found to roam across all lands, it only makes sense that dinosaurs lived in the ocean as well.    Mosasaurus is one of the extinct water reptiles. Known as the lizard of the Meuse River or simply the Meuse Lizard, the creature was a carnivore and lived around 66 to 70 million years ago.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Diplodocus', 'Can you imagine an animal as long as a city bus? Well, that’s how big a regular Diplodocus could get. It is interesting to note that the Dino is named after the structure of its body – double-beamed.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Tyrannosaurus Rex', 'Tyrannosaurus, more commonly known as T-Rex, is undoubtedly the most famous dinosaur. You may be surprised to know that the term “Tyrannosaurs” essentially means “tyrant lizard king”. After being depicted multiple times in different forms of media, today, everyone knows that the T-Rex is a carnivore.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Styracosaurus', 'Styracosaurus roamed the earth in the Cretaceous period, which is a geological period that spanned 70 million years! The special thing about this period is that it ended 66 million years back when dinosaurs went extinct.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Baryonyx', 'The term Baryonyx is Latin for “heavy claw”. As the name suggests, the dinosaur had strong, claws, which it made use of to hunt and feed. However, it is not famous for its colossal claws or the long balancing tail. Instead, its most characterizing feature is its crocodilian head!', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Parasaurolophus', 'Parasaurolophus were herbivores that could walk on two as well as four legs! This dinosaur is characterized by its oddly shaped head, having a curved crest. These majestic animals wandered across the plains of North America around 75 million years ago. Their fossils have been found all around, including Canada, Utah, Alberta, Mexico, and even the USA.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Spinosaurus', 'Spinosaurus is none other than the leading star of “Jurassic World III”. Also known as spine lizards, these carnivorous dinosaurs could grow up to 15m in length and 16 meters in height. It is shame to note that once an almost complete skeleton of Spinosaurus was at display in a museum in Germany but it was destroyed during the WWII.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Silvisaurus', 'Silvisaurus is one of the many types of armored dinosaurs. Armored dinosaurs are typically defined as four-legged herbivores with distinctive body armor. While it is common to think of dinosaurs as large and scary, Silvisaurus was quite the opposite.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Brachiosaurs', 'Brachiosaurs is one of the gentle giants. With their long front legs and never-ending necks, these huge herbivorous dinosaurs were specially designed to reach the treetops and devour the fresh leaves. If dinosaurs existed in our time, Brachiosaurs probably would have loved to give you rides!', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Pterodactyl', 'Pterodactyl is the image that conjures up in your mind when you think about a flying dinosaur. Almost all winged dinosaurs portrayed in modern fiction have been inspired by this giant bird-dino, which resided in Europe and Africa.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Lirainosaurus', 'Lirainosaurus were herbivores with long necks. It is easy to imagine a Lirainosaurus enjoying fresh and juicy leaves off the tops of the trees in vast green fields. They are known to have inhabited Europe and seemed to especially prefer Spain.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Iguanodon', 'Iguanodon was perhaps the first dinosaur identified by the scientists. The discovery was made when local workers unearthed fossil teeth in British forest. They took their findings to the neighborhood doctor, Gideon Mantell, who realized that they were not dealing with something ordinary.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Allosaurus', 'Allosaurus lived around 150 million years ago. With their huge jaws lined with razor sharp-teeth, these dinosaurs were ferocious meat-eaters. What makes them even more terrifying is that, unlike the T-Rex, the hand claws of Allosaurus were more than 1 foot long!', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Brontosaurus', 'The name “Brontosaurus” comes from the Greek language and translates to “thunder lizard”. These dinosaurs are quite famous in Hollywood. In fact, this species of dinosaurs was not only featured in films and other types of fiction but also managed to make their way to postal stamps!', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Gallimimus', 'With big eyes on each side of a relatively small head, adult Gallimimus weighed around 440 kilograms and were approximately 6 meters long and roamed prehistoric Asia. Scientists have reasons to believe that Gallimimus might have feathers on its body. Can you imagine a dinosaur without teeth?', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Isanosaurus', 'Herbivore and native to Asia, Isanosaurus lived in the Triassic period, which occurred between 250 million and 199 million years ago. These dinosaurs made Asia their home, especially Thailand, approximately 210 million years ago. If you really want to brush up on your knowledge about dinosaurs, ', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Stegosaurus', 'Out of all the dinosaurs, Stegosaurus is one of the most distinctive ones out there. It is easily recognized, owing to the two rows of armored plates that ran down its bulky back, down the length of its spine, to its tail. It had a short bulky body and held its tail to the ground.   It squats slightly as its hind legs were longer than the front legs. It was a herbivore and usually grazed on the ground. While experts believe that Stegosaurus inhabited areas of Europe and North America, Its fossils remains have been discovered as far to the East as China!', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Carnotaurus', 'This is a terrifying one! With devil horns protruding from both sides of its head, Carnotaurus was nothing less than the devil of the prehistoric world. Its name translates to the “meat-eating bull” –talk about scary. It is that one species of dinosaurs that makes us thankful to Mother Nature for not allowing the timeline of dinosaurs cross ours!', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Tsintaosaurus', 'Native to Asia, Tsintaosaurus could easily have been the unicorn of the dinosaur world! It is interesting to note that the true appearance of the Tsintaosaurus is still a mystery to us.  Sure, we have the skulls and other bone structures to work with. However, reinventing the original appearance of an extinct animal based merely on the shape of a few bones is not an easy task!  While we know that the Tsintaosaurus had a single horn protruding from the middle of its head, some scientists believe that it was probably more like a shoehorn than a unicorn.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Coelophysis', 'Scientists have unearthed hundreds of Coelophysis. These dinosaurs were born hunters. It is believed that they would dine on anything and everything, including other Coelophysis – talk about being a foodie!  Despite being an excellent hunter, these dinosaurs were relatively small in size, growing only up to 3 meters in length and 1.3 meters in height.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Triceratops', 'Are you wondering why this distinctive looking dinosaur is called triceratops?  Well, it is because of its three horns and the bony frail around its neck, which is perhaps the most distinctive feature of this ancient reptile. If you are a fan of the movie, The Jurassic Park, you may already know what triceratops are all about.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Ankylosaurus', 'Ankylosaurus roamed the grounds more than 66 million years ago. They were one of the last remaining dinosaurs. In fact, experts believe that these dinosaurs were there to witness the dino-apocalypse and mass extinction. The term “Ankylosaurus” means “fused lizard”. While they did not look much like the modern lizards, the name is aptly suitable.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Europasaurus', 'Belonging to the Sauropod family, Europasaurus is probably the tiniest member of the family member. It is interesting to note that Europasaurus are known from a single excavation in Germany.  However, the excavation site contained more than 10 animals. While a complete skeleton is yet to be discovered, scientists have unearthed multiple bones that have helped discern the anatomy of Europasaurus.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Andesaurus', 'Among the long-necked dinosaurs, Andesaurus were the real giants! Also known as the vine lizards, these dinosaurs were herbivores. They could grow up to 13 meters in height, 40 meters in length, and 80 tons in weight.', 'Y');
INSERT INTO resources (resource_id, person_name, description_, is_active) VALUES (resource_id.NEXTVAL, 'Raptorex', 'Raptorex, more commonly known as Raptor, is another rather famous carnivore in the world of dinosaurs. They originate from Asia and some of the most important Raptorex fossils have been located in China and Mongolia.', 'Y');
--
-- @TODO: ADD 25 MORE
--
COMMIT;



--
-- SKILLS
--
-- SELECT skill_code, skill_name FROM skills;
--
INSERT INTO skills (skill_code, skill_name) VALUES ('DEPL',     'Deployment Manager');
INSERT INTO skills (skill_code, skill_name) VALUES ('DEVOPS',   'Dev Ops Engineer');
INSERT INTO skills (skill_code, skill_name) VALUES ('ARCH',     'Technical Architect');
INSERT INTO skills (skill_code, skill_name) VALUES ('CC',       'Cloud Consultant');
INSERT INTO skills (skill_code, skill_name) VALUES ('T',        'Tester');
INSERT INTO skills (skill_code, skill_name) VALUES ('DEV',      'Developer');
INSERT INTO skills (skill_code, skill_name) VALUES ('BA',       'Business Analytist');
INSERT INTO skills (skill_code, skill_name) VALUES ('PM',       'Project Manager');
--
COMMIT;



--
-- PROJECTS AND TASKS
--
-- SELECT project_id, project_name, description_, status, is_active, owner_id, manager_id FROM projects;
-- SELECT task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate FROM tasks;
--
INSERT INTO projects (project_id, project_name, description_, status, is_active) VALUES (project_id.NEXTVAL, 'Project Management in 2 days', 'Homework', 'ACTIVE', 'Y');
--
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Auth roles, Users + security checks', 'DESCRIPTION', 'READY', 'HIGH', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Fix status in Projects (more options)', 'DESCRIPTION', 'IN-PROGRESS', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Email notifications', 'DESCRIPTION', 'READY', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Caneldar in Grids should start on Monday', 'DESCRIPTION', 'READY', 'LOW', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Bulk change tasks sprint (to another or NULL)', 'DESCRIPTION', 'READY', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Add feature to move/assign tasks in bulk', 'DESCRIPTION', 'READY', 'HIGH', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Add form on Tasks to create new task', 'DESCRIPTION', 'READY', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Show Resource.is_active in Tasks report?', 'DESCRIPTION', 'READY', 'LOW', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Available resources in Grids + trigger check?', 'DESCRIPTION', 'READY', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Dashboard velocity', 'DESCRIPTION', 'READY', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Kanban board with 3 task status columns & Cards', 'Ideally do drag and drop for status change', 'READY', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
--
INSERT INTO projects (project_id, project_name, description_, status, is_active) VALUES (project_id.NEXTVAL, 'Chair Booking', 'Booking chairs in the office', 'ACTIVE', 'Y');
--
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Implement SSO', 'DESCRIPTION', 'READY', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Fix performance issues on page 174', 'DESCRIPTION', 'COMPLETE', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
--
INSERT INTO projects (project_id, project_name, description_, status, is_active) VALUES (project_id.NEXTVAL, 'DC Layout Tool', 'Depot visualisation', 'ACTIVE', 'Y');
--
INSERT INTO projects (project_id, project_name, description_, status, is_active) VALUES (project_id.NEXTVAL, 'PO Book', 'Purchase orders', 'ACTIVE', 'Y');
--
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Design data model', 'DESCRIPTION', 'COMPLETE', 'NORMAL', project_id.CURRVAL, NULL, NULL, NULL);
INSERT INTO tasks (task_id, task_title, description_, status, priority_, project_id, resource_id, sprint_id, estimate) VALUES (task_id.NEXTVAL, 'Python to change existing XLSX template', 'DESCRIPTION', 'READY', 'HIGH', project_id.CURRVAL, NULL, NULL, NULL);
--
INSERT INTO projects (project_id, project_name, description_, status, is_active) VALUES (project_id.NEXTVAL, 'Car Pool', 'Booking company pool/shared cars', 'ACTIVE', 'Y');
--
COMMIT;

