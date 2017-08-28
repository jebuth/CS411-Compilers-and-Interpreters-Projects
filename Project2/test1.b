// valid B program
void main()
{
    int x;
    int y;
    int z;
    x = 4;
    y = 16;
    z = x * y;
    x = y + z;
    y = z - x;
    x = -y;
    z = x % y;
    printf("%d %d %d\n", x, y, z);
}