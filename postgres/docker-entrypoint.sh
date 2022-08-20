#!/bin/bash

set -o errexit
set -e
set -u

main() {
  init_db
}

init_db() {
  echo "Creating database"
  psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER <<-EOSQL
    CREATE SCHEMA graphql;
    CREATE TABLE IF NOT EXISTS graphql.todos (
      id SERIAL PRIMARY KEY,
      title TEXT,
      description TEXT,
      category TEXT,
      is_complete BOOLEAN,
      created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    INSERT INTO graphql.todos (title, description, category, is_complete) VALUES
    ('Aut ipsum rerum.', 'Quasi similique facere voluptatibus magni et aut perspiciatis. Optio ea totam error laboriosam. Consectetur illo commodi dolorem et nulla omnis natus qui.', 'Urgent', True)
    ('Corporis porro.', 'Optio non vel at necessitatibus sed sunt eius. Quibusdam omnis vel nihil temporibus velit. Molestias ex sapiente inventore non a maiores autem.', 'For later', True, NULL),
    ('Delectus nam ut.', 'Nesciunt rerum sed corporis fugiat natus. Aut voluptatibus esse voluptatum minima enim dignissimos est deleniti.', 'Blocked', False, NULL),
    ('Sint quis officia.', 'Consequatur ut doloribus rem cumque. Dicta minus iusto aspernatur aut repudiandae est. Et omnis minus officia. Quaerat voluptas perspiciatis enim culpa aut voluptatem mollitia maxime.', 'Blocked', False, NULL),
    ('Recusandae quia.', 'Unde dolorem id minima voluptate deserunt. Eaque et ullam molestias odio dolor at sunt. Molestiae consequuntur tenetur eum quas. Sit voluptatem perspiciatis iusto consectetur.', 'Important', False, NULL),
    ('Nemo quia eligendi.', 'Magnam ex quia aut quo non voluptas pariatur. Debitis dolores dolore molestiae molestiae voluptatem. Quaerat perspiciatis consequatur ratione consequatur sed id. Quia nam fugiat sit earum vel.', 'Needs focus time', True, NULL),
    ('Veritatis non ipsa.', 'Cupiditate blanditiis enim aut. Vel repellendus expedita maxime reiciendis. Veritatis occaecati tenetur et.', 'For later', True, NULL),
    ('Magni non ducimus.', 'Ipsa expedita adipisci sint repellendus nemo eligendi placeat. Aut officiis praesentium commodi ex ut. Aliquam voluptas labore dicta blanditiis in ea.', 'Blocked', True, NULL),
    ('Eos est eos.', 'Rerum laborum quia non necessitatibus fugiat voluptatem. Sapiente iste id hic dignissimos atque. Quia quia cum ipsum possimus.', 'Needs focus time', True, NULL),
    ('Culpa nisi odio.', 'Aut ipsam ipsam possimus quis ratione est voluptates voluptas. Modi incidunt mollitia culpa. Odio hic perspiciatis nesciunt consectetur voluptatibus fugiat.', 'Needs focus time', False, NULL),
    ('Sunt voluptatum et.', 'Rerum quidem distinctio nesciunt nulla libero enim. Nostrum eligendi accusamus autem odit. Aut sit in sint molestiae quia. Deserunt labore nostrum tempora quibusdam qui saepe.', 'For later', True, NULL),
    ('Et corporis velit.', 'Omnis doloribus voluptas blanditiis nemo sunt hic consequatur. Nostrum et sunt ut ducimus. Maxime velit omnis eveniet quis aliquam molestias maiores.', 'For later', False, NULL),
    ('Excepturi incidunt.', 'Eos ut numquam ipsa occaecati consequatur. Ducimus et a doloremque est. Praesentium sunt officiis fuga adipisci ut nobis atque. Voluptas magnam maiores occaecati.', 'Needs focus time', False, NULL),
    ('Voluptas dolorem.', 'Minus dicta autem temporibus asperiores officiis voluptas quasi. Ut sequi quia odio suscipit. Numquam et ex dolor dignissimos dolores.', 'Urgent', True, NULL),
    ('Sit nihil aut.', 'Deleniti sit voluptatem voluptates qui. Voluptas omnis accusantium ad quis. Omnis deleniti vel in fuga eos. Molestiae vero tenetur minima quis sunt ut aliquam.', 'Important', False, NULL),
    ('Non rerum.', 'Et molestias est aut consequatur consequuntur quia. Dignissimos dolor autem velit quisquam.', 'Needs focus time', True, NULL),
    ('Praesentium ipsa.', 'Neque et quo asperiores assumenda. Ad voluptatem quis ut vero neque fuga corrupti at. Illo aliquam pariatur maiores exercitationem sit odit. Enim qui est alias temporibus ut aut.', 'Blocked', False, NULL),
    ('Vel consequatur.', 'Quidem ab quos dolore non qui. Asperiores molestiae commodi amet. Asperiores quae sunt itaque enim aut. Quo voluptate aspernatur nihil velit iure expedita cumque numquam.', 'For later', False, NULL),
    ('Rem consequatur.', 'Eum sint cum tempora quia quo nisi. Vel velit quae ut et. Animi sint eveniet ut ea ipsum. Omnis est laudantium non omnis assumenda. Modi amet recusandae eum mollitia enim quia.', 'Blocked', False, NULL),
    ('Vel autem nostrum.', 'Laboriosam sunt repellendus et ut eaque. Voluptas repellendus sunt assumenda magni quam. Et et nemo iste est sed vero.', 'Needs focus time', False, NULL),
    ('Quod nam quaerat.', 'Omnis molestiae dolore consequatur amet est et. Qui hic et est omnis eveniet. Et vero autem qui nesciunt omnis amet. Eum eos nisi est iusto mollitia molestiae.', 'Important', False, NULL),
    ('Magnam ab qui.', 'Nulla ratione nam praesentium consequatur ex saepe. Non itaque rem fuga numquam nam. Dolores non vitae tempore explicabo doloremque sint tempora. Aspernatur qui nam aut et cum.', 'Needs focus time', False, NULL),
    ('Dolores dolorem et.', 'Nostrum sed quam temporibus temporibus excepturi et at. Tenetur voluptatem accusamus omnis temporibus tempore. Sint animi nihil magnam asperiores.', 'Blocked', False, NULL),
    ('Ratione quos fuga.', 'Veritatis qui dolor facere enim non. Quaerat alias expedita enim dolorem. Omnis ex dolorum nam sequi aut. Aliquid qui voluptate non mollitia ab culpa.', 'Needs focus time', False, NULL),
    ('Dolorum et laborum.', 'Et qui eum ea repudiandae necessitatibus reprehenderit. Accusantium ex velit voluptatem et ea culpa consectetur.', 'Important', True, NULL),
    ('Fugiat harum quae.', 'Sapiente dolores dolore voluptas dignissimos. Aut omnis neque optio voluptatem placeat. Omnis iusto aliquam adipisci quas corporis commodi. Nulla quis in nihil omnis. Ratione laborum rerum expedita.', 'Urgent', False, NULL),
    ('Minus et dolor eius.', 'Alias impedit vel ut qui eos est et quae. Et consequatur accusantium qui molestiae at. In ipsa autem consequatur dicta est. Et voluptatem fugiat eum.', 'Urgent', False, NULL),
    ('Sunt veniam quia.', 'Sed expedita beatae voluptas ratione animi. Facere magnam cumque facere unde voluptate veritatis. Placeat animi autem aut natus porro dolore. Rem recusandae libero qui adipisci omnis cupiditate ut.', 'Blocked', True, NULL),
    ('Laborum ea qui est.', 'Corrupti omnis corporis sed vitae provident. Molestiae quibusdam accusamus itaque corrupti sequi. Praesentium omnis iste ut et vero non praesentium.', 'Urgent', True, NULL),
    ('Et repellat aut.', 'Molestiae voluptatem ipsa perferendis labore id. Enim voluptatem fuga reprehenderit iusto sed et. Nihil amet provident quod non reiciendis perspiciatis exercitationem ipsum.', 'Blocked', True, NULL),
    ('Omnis corrupti.', 'Modi vitae id enim placeat tenetur. Molestias quod reprehenderit soluta beatae eos. Accusantium ut minus perferendis ab libero consequuntur nulla est.', 'Blocked', True, NULL),
    ('Ex architecto ad.', 'Dignissimos qui et ut commodi qui est aut eos. Quia repellat maxime expedita consequuntur. Eligendi quia dolore aut. Expedita tempore omnis rerum eaque eos rerum consectetur.', 'Important', False, NULL),
    ('Quam consequatur.', 'Amet error provident laudantium nisi aperiam quos. Ut est qui delectus repellendus reprehenderit. Ex minus tempora dolorem. Dolore sed enim sit eaque rerum.', 'Important', False, NULL),
    ('Minus earum eveniet.', 'Facere aut ut repellat in. Deserunt sit aut similique nemo quis aut eum. Corrupti excepturi enim ut. Impedit qui sit nihil aliquid. Dolor provident delectus doloribus alias molestias.', 'Blocked', True, NULL),
    ('Est illum quidem et.', 'Magnam quasi dolores dolor vel est. Voluptatibus sed sed cumque autem.', 'Important', True, NULL),
    ('Voluptate minima.', 'Voluptatem laborum dolores omnis consequatur nisi asperiores placeat. Minima aut tempora tempora veniam voluptatem quam assumenda. Adipisci quidem incidunt tempora omnis consequatur quo quia.', 'Blocked', False, NULL),
    ('Laboriosam facilis.', 'Architecto dolor fugiat nulla laborum. Aut sint eveniet in consectetur illo. Dolores aut minima adipisci voluptates quae accusantium. Aut sint non dolorem consectetur nobis.', 'Blocked', True, NULL),
    ('Ut amet ut.', 'Similique distinctio quis enim minus velit. Quis placeat totam quam mollitia. Dolor natus fugiat consequatur vero nesciunt.', 'Blocked', False, NULL),
    ('Et sed occaecati.', 'Sunt sint necessitatibus veritatis quod commodi molestiae. Omnis sint voluptatem molestias et ipsa. Veniam magnam ab modi cumque unde ducimus voluptatibus.', 'For later', True, NULL),
    ('Saepe ea deserunt.', 'A quos est ut quia laudantium laudantium illum. Eos maxime ipsam debitis vel quod enim. Repudiandae voluptatem ut fugiat ut. Error suscipit quo qui sint.', 'For later', False, NULL),
    ('Aut et modi.', 'Sit voluptates et quo saepe consequatur. Quis sit fuga laboriosam numquam dolores. Dolorum aut nesciunt est. Magnam porro sed reiciendis totam vel quibusdam illum.', 'Needs focus time', True, NULL),
    ('Minus vitae.', 'Vel quasi dicta voluptatem voluptates fugit doloribus deleniti. Aspernatur nulla vero sed quis incidunt. Officia et autem hic explicabo. Esse placeat sunt est vitae.', 'Urgent', False, NULL),
    ('Nam sequi sed et.', 'Minus sed earum culpa ex perspiciatis. Ut totam non delectus. Porro tempore non laboriosam est fugit. Debitis ad maxime voluptas voluptatum. Voluptatem cupiditate suscipit voluptatibus nobis.', 'Blocked', True, NULL),
    ('Sit voluptates qui.', 'Consequuntur rerum cum et aspernatur est consequuntur mollitia. Dolor ratione voluptatem dolores ut ex. Qui voluptas consectetur a fugiat magnam et magnam. Quaerat ex qui qui illo ad adipisci.', 'Blocked', True, NULL),
    ('Voluptas porro.', 'Quia ut quam aut et. Vel est exercitationem eveniet sunt aliquid. Eius eos expedita iure consequuntur quisquam aut.', 'Needs focus time', True, NULL),
    ('Voluptatibus quo.', 'Architecto dolorem culpa quis rem nemo tenetur neque est. Temporibus nesciunt officiis voluptatem quibusdam. Perferendis nam itaque in.', 'For later', False, NULL),
    ('Odio sed temporibus.', 'Eum et atque ut sed pariatur voluptatem. Ea voluptatem sit voluptas recusandae explicabo excepturi cum. Quia nesciunt doloribus voluptatibus quis optio nostrum quasi. Quo amet deserunt illo sed ut.', 'Important', False, NULL),
    ('Quo dolor eum enim.', 'Dolore non enim illo eveniet esse. Et quas omnis sit consequuntur.', 'Blocked', True, NULL),
    ('Fuga cupiditate.', 'Ea necessitatibus at unde magnam. Fugit sapiente architecto dolorum et. Nostrum qui voluptatem qui dolorem quisquam et quasi molestiae. Consequatur minima odio fugiat est aut vitae.', 'Urgent', True, NULL),
    ('Est esse voluptates.', 'Occaecati dolore quas iure molestias ea omnis ut. Esse enim voluptas molestias a et reprehenderit iure. Beatae accusamus debitis tempora nemo non. Deleniti velit fuga ratione fuga officiis commodi.', 'Important', True, NULL);
EOSQL
  echo "Successfully created database"
}

main "$@"
