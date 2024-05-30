import type { Metadata } from "next";
import { Inter, Open_Sans } from "next/font/google";
import "./globals.css";
import { Providers } from "./providers";

const inter = Inter({ subsets: ["latin"] });
const open_sans = Open_Sans({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Rafindo Jaya Admin",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body className={open_sans.className}>
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
