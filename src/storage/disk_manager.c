#include "disk_manager.h"

#include <stdio.h>
#include <string.h>

int write_disk(char *file, char *data) {
  if (strlen(data) != PAGE_SIZE) {
    printf("Data different than disk size of 4000 bytes!\n");
    return 1;
  }

  FILE *f;
  f = fopen(file,"wb");
  if (f==NULL) {
    printf("Error opening file!\n");
    return 1;
  }

  fwrite(data, sizeof(char), PAGE_SIZE, f);
  fclose(f);

  return 0;
}

int read_disk(char *file, char *data) {
  FILE *f;
  f = fopen(file, "rb");
  if (f==NULL) {
    printf("Error opening file!\n");
    return -1;
  }

  if (data == NULL) {
    printf("Error with memory allocation");
    return -1;
  }

  size_t bytes_read = fread(data, 1, PAGE_SIZE, f);
  fclose(f);

  return bytes_read;
}
