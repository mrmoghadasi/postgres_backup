# PostgreSQL Database Backup Script

This bash script facilitates automated backups for a PostgreSQL database and ensures its safe storage while allowing for easy restoration if needed.

## Purpose
The script performs the following tasks:
- Connects to the specified PostgreSQL database and creates a SQL dump of its contents.
- Compresses the SQL dump into a ZIP file for efficient storage.
- Transfers the compressed backup to a designated backup server using SSH and `rsync`.
- Deletes older backups to maintain a defined retention period.

## Usage
1. **Setup**:
    - Modify the variables within the script to match your environment:
        - `db_name`: Replace `pg_name` with the name of your PostgreSQL database.
        - `backupfolder`: Specify the directory where backups should be stored.
        - `keep_day`: Set the number of days to retain backups.
    - Ensure the script has executable permissions: `chmod +x backup_script.sh`

2. **Execution**:
    - Run the script: `./backup_script.sh`
    - Check the generated log file (`db_backup.log`) for any errors or successful backup entries.

## Configuration
- `pg_dump`: PostgreSQL utility used to create a dump of the specified database.
- `gzip`: Compression utility to compress the SQL dump into a ZIP file.
- `rsync`: Utilized for transferring the backup files securely to the backup server.
- `ssh`: Secure shell protocol used for encrypted communication during file transfer.

## Important Notes
- Ensure PostgreSQL is properly configured to allow `pg_dump` to access the specified database.
- Adjust permissions and settings as necessary to enable the script to run smoothly.
- Regularly monitor backup logs and verify backups on the backup server for integrity.

## Script Maintenance
- Regularly review log files (`db_backup.log`) for any errors or warnings.
- Adjust retention settings (`keep_day`) based on your backup storage requirements.

## Disclaimer
- This script is provided as-is and might need adjustments based on specific system configurations.
- Use it at your own discretion and ensure backups are tested for recovery periodically.



## License

[MIT](https://choosealicense.com/licenses/mit/) 
This project is licensed under the MIT License.

## Credits

This project was created by My User (mrm.elec@email.com)

[![LinkedIn](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/mrmoghadasi/)](https://www.linkedin.com/in/mrmoghadasi/) [![Gmail]
(https://img.shields.io/badge/-Gmail-red?style=flat-square&logo=Gmail&logoColor=white&link=mailto:mrm.elec@gmail.com)](mailto:mrm.elec@gmail.com)


